#include <stdio.h>
#include <stdlib.h>
#include <postgresql/libpq-fe.h>

int main(int argc, char *argv[])
{
    PGconn *conn;

    conn = PQconnectdb(argc > 1 ? argv[1] : "");

    if (PQstatus(conn) != CONNECTION_OK)
    {
        fprintf(stderr, "Connection Failed: %s", PQerrorMessage(conn));
        PQfinish(conn);
        exit(-1);
    }

    printf("--username=%s --password=%s --url=jdbc:postgresql://%s:%s/%s\n",
           PQuser(conn), PQpass(conn), PQhost(conn), PQport(conn), PQdb(conn));

    return 0;
}
