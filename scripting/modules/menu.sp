void Menu_Players(int client) {
    Menu menu = new Menu(MenuHandler_Players);

    menu.SetTitle("%T", TITLE_OBSERVE_PLAYER, client);

    Menu_AddPlayers(menu);

    menu.Display(client, MENU_TIME_FOREVER);
}

public int MenuHandler_Players(Menu menu, MenuAction action, int param1, int param2) {
    if (action == MenuAction_Select) {
        char info[INFO_SIZE];

        menu.GetItem(param2, info, sizeof(info));

        int userId = StringToInt(info);
        int target = GetClientOfUserId(userId);

        if (target == INVALID_CLIENT) {
            Menu_Players(param1);
            Message_PlayerIsNoLongerAvailable(param1);
        } else {
            UseCase_StartObservation(param1, target);
        }
    } else if (action == MenuAction_End) {
        delete menu;
    }

    return 0;
}

void Menu_AddPlayers(Menu menu) {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            int userId = GetClientUserId(client);
            char info[INFO_SIZE];
            char item[MAX_NAME_LENGTH];

            IntToString(userId, info, sizeof(info));
            Format(item, sizeof(item), "%N", client);

            menu.AddItem(info, item);
        }
    }
}
