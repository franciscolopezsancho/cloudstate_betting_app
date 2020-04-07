const EventSourced = require("cloudstate").EventSourced;

const entity = new EventSourced(
    ["bettinghouse.proto", "domain.proto"],
    "org.example.bettinghouse.BettingHouseService",
    {
        persistenceId: "shopping-cart",
        snapshotEvery: 100
    }
);

// Export the entity
module.exports = entity