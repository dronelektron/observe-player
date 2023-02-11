void Message_ObserveUsage(int client) {
    ReplyToCommand(client, "%s%s", PREFIX, "Usage: sm_observe <#userid|name>");
}

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
    CPrintToChat(client, "%t%t", PREFIX_COLORED, "Observation started", target);
}

void Message_ObservationStopped(int client) {
    CPrintToChat(client, "%t%t", PREFIX_COLORED, "Observation stopped");
}
