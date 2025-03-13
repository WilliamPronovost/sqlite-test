#include "entrypoint.h"
#include "sqlite3.h"
#include "knob.h"

#include <time.h>
#include <stdlib.h>

#define LOG_SQLITE3_ERROR(db) knob_log(KNOB_ERROR, "%s:%d: SQLITE3 ERROR: %s\n", __FILE__, __LINE__, sqlite3_errmsg(db))

void creer_joueur(sqlite3* db,char* nom_joueur){
    sqlite3_stmt* stmt = NULL;
    char content[] = 
    "INSERT INTO joueurs(joueurNom, joueurVie, joueurForce)\n"
    "VALUES\n"
    "(?, 100, 10);\n";
    int ret = sqlite3_prepare_v2(db,content,-1,&stmt,NULL);

    if(ret != SQLITE_OK){
        LOG_SQLITE3_ERROR(db);
    }

    if(sqlite3_bind_text(stmt,1,nom_joueur,-1,SQLITE_STATIC) != SQLITE_OK){
        LOG_SQLITE3_ERROR(db);
    }
    ret = sqlite3_step(stmt);
    if(ret != SQLITE_OK){
        LOG_SQLITE3_ERROR(db);
    }
    sqlite3_finalize(stmt);
}

void raylib_start(void){
    srand(time(NULL));
    sqlite3* db = NULL;
    sqlite3_open("./aventure.db",&db);
    creer_joueur(db, "William");
    // add_random_fruit(db); //Uncomment to add a random fruit...
    sqlite3_close(db);
    return;
}