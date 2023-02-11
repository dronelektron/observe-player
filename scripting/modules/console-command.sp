void Command_Create() {
    RegConsoleCmd("sm_observe", Command_Observe);
}

public Action Command_Observe(int client, int args) {
    if (args < 1) {
        Message_ObserveUsage(client);

        return Plugin_Handled;
    }

    char name[MAX_NAME_LENGTH];

    GetCmdArg(1, name, sizeof(name));

    int target = FindTarget(client, name);

    if (target != CLIENT_NOT_FOUND) {
        UseCase_StartObservation(client, target);
    }

    return Plugin_Handled;
}
