static int g_target[MAXPLAYERS + 1];

void UseCase_ResetTarget(int client) {
    g_target[client] = CLIENT_NOT_FOUND;
}

void UseCase_StartObservation(int client, int target) {
    if (client == target) {
        Message_YouCannotObserveYourself(client);

        return;
    }

    if (UseCase_IsClientSpectator(target)) {
        Message_YouCannotObserveDeadPlayer(client);

        return;
    }

    if (g_target[client] == target) {
        Message_YouAreAlreadyObserving(client, target);

        return;
    }

    g_target[client] = target;

    ChangeClientTeam(client, TEAM_SPECTATOR);
    UseCase_AttachCamera(client);
    Message_ObservationStarted(client, target);
}

void UseCase_StopObservations(int target) {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client) && g_target[client] == target) {
            UseCase_StopObservation(client);
        }
    }
}

void UseCase_StopObservation(int client) {
    if (g_target[client] == CLIENT_NOT_FOUND) {
        return;
    }

    if (UseCase_IsClientSpectator(client)) {
        UseCase_DetachCamera(client);
    }

    UseCase_ResetTarget(client);
    Message_ObservationStopped(client);
}

void UseCase_AttachCameras(int target) {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client) && g_target[client] == target) {
            UseCase_AttachCamera(client);
        }
    }
}

void UseCase_AttachCamera(int client) {
    SetEntProp(client, Prop_Send, "m_iObserverMode", OBSERVER_MODE_FIRST_PERSON);
    SetEntPropEnt(client, Prop_Send, "m_hObserverTarget", g_target[client]);
}

void UseCase_DetachCamera(int client) {
    SetEntProp(client, Prop_Send, "m_iObserverMode", OBSERVER_MODE_FREE_CAMERA);
}

bool UseCase_IsClientSpectator(int client) {
    return GetClientTeam(client) == TEAM_SPECTATOR;
}
