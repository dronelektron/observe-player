#include <sourcemod>

#include "morecolors"

#include "op/message"
#include "op/use-case"

#include "modules/console-command.sp"
#include "modules/event.sp"
#include "modules/message.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Observe player",
    author = "Dron-elektron",
    description = "Allows you to observe a specific player",
    version = "1.0.0",
    url = "https://github.com/dronelektron/observe-player"
};

public void OnPluginStart() {
    Command_Create();
    Event_Create();
    LoadTranslations("common.phrases");
    LoadTranslations("observe-player.phrases");
}

public void OnClientConnected(int client) {
    UseCase_ResetTarget(client);
}

public void OnClientDisconnect(int client) {
    UseCase_StopObservations(client);
}
