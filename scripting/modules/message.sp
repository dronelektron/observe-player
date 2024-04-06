void Message_YouCannotObserveYourself(int client) {
    ReplyToCommand(client, "%s%t", PREFIX, "You cannot observe yourself");
}

void Message_YouCannotObserveDeadPlayer(int client) {
    ReplyToCommand(client, "%s%t", PREFIX, "You cannot observe dead player");
}

void Message_YouAreAlreadyObserving(int client, int target) {
    ReplyToCommand(client, "%s%t", PREFIX, "You are already observing", target);
}

void Message_ObservationStarted(int client, int target) {
    PrintToChat(client, COLOR_DEFAULT ... "%t%t", PREFIX_COLORED, "Observation started", target);
}

void Message_ObservationStopped(int client) {
    PrintToChat(client, COLOR_DEFAULT ... "%t%t", PREFIX_COLORED, "Observation stopped");
}

void Message_PlayerIsNoLongerAvailable(int client) {
    ReplyToCommand(client, "%s%t", PREFIX, "Player is no longer available");
}
