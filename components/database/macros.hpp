#include "../../macros.hpp"

#define DATABASE_VERSION dev
#define DATABASE_VAR CONCAT(f_db_,worldName)

#define GET_DATABASE() (profileNamespace getVariable [STR(DATABASE_VAR), []])
#define DATABASE_EXISTS() (!(GET_DATABASE() isEqualTo []))

#define DB_INDEX_VERSION 0
#define DB_INDEX_OBJECTIVES 1
