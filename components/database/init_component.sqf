#include "macros.hpp"

if !(DATABASE_EXISTS()) then
{
    [] call f_fnc_buildNewDatabase;
};
