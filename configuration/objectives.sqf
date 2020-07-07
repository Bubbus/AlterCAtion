#include "..\altercationMacros\objectives_macros.hpp"

BEGIN_OBJECTIVES;


// Go away Poliakko
EXCLUDE_LOCATION("Poliakko");


// CA Cool Club
_location = NEW_LOCATION_ENTRY("CACoolClub");

SET_LOCATION_DISPLAY_NAME(_location,"CA Cool Club");
SET_LOCATION_TYPE(_location,"NameVillage");
SET_LOCATION_POSITION(_location,12040,10528);
SET_LOCATION_RADIUS(_location,200);

ADD_LOCATION(_location);

// Make CA Cool Club an abandoned BLUFOR settlement.
_state = NEW_OBJECTIVE_STATE("CACoolClub");

SET_OBJECTIVE_OWNER(_state,OWNER_BLUFOR);
SET_OBJECTIVE_STATUS(_state,STATUS_ABANDONED);

EDIT_OBJECTIVE_STATE(_state);


// Make Zaros a military location.
_location = NEW_LOCATION_ENTRY("Zaros");
SET_LOCATION_TYPE(_location,"Strategic");

EDIT_LOCATION(_location);


// Don't add anything else below this line.
FINALIZE_OBJECTIVES;
