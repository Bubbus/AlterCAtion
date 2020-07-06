#include "..\objectives_macros.hpp"

BEGIN_OBJECTIVES;


// Go away Poliakko
EXCLUDE_LOCATION("Poliakko");


// CA Cool Club
_location = NEW_LOCATION();

SET_LOCATION_NAME(_location,"CA Cool Club");
SET_LOCATION_TYPE(_location,"NameVillage");
SET_LOCATION_POSITION(_location,2000,2000);
SET_LOCATION_RADIUS(_location,200);

ADD_LOCATION(_location);


// Make Zaros a military location.
_location = CREATE_LOCATION("Zaros");
SET_LOCATION_TYPE(_location,"Strategic");

EDIT_LOCATION(_location);


// Don't add anything else below this line.
FINALIZE_OBJECTIVES;
