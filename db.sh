function install_postgres {
    sudo apt update
    sudo apt install postgresql postgresql-contrib pgadmin3
    # Set password to the postgres account
    # sudo -u postgres psql
    # ALTER USER user_name WITH PASSWORD 'new_password'
}

function main {
    # Ref : https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04
    install_postgres
}

main

##############################################
# Steps to uninstall postgresql in ubuntu #
##############################################

#     List All Postgres related packages

#     dpkg -l | grep postgres

#     ii  postgresql                            8.3.17-0ubuntu0.8.04.1           object-relational SQL database (latest versi
#     ii  postgresql-8.3                        8.3.9-0ubuntu8.04                object-relational SQL database, version 8.3
#     ii  postgresql-client                     8.3.9-0ubuntu8.04                front-end programs for PostgreSQL (latest ve
#     ii  postgresql-client-8.3                 8.3.9-0ubuntu8.04                front-end programs for PostgreSQL 8.3
#     ii  postgresql-client-common              87ubuntu2                        manager for multiple PostgreSQL client versi
#     ii  postgresql-common                     87ubuntu2                        PostgreSQL database-cluster manager
#     ii  postgresql-contrib                    8.3.9-0ubuntu8.04                additional facilities for PostgreSQL (latest
#     ii  postgresql-contrib-8.3                8.3.9-0ubuntu8.04                additional facilities for PostgreSQL

#     Remove all above listed

#     sudo apt-get --purge remove postgresql postgresql-8.3  postgresql-client  postgresql-client-8.3 postgresql-client-common postgresql-common  postgresql-contrib postgresql-contrib-8.3

#     Remove the following folders

#     sudo rm -rf /var/lib/postgresql/
#     sudo rm -rf /var/log/postgresql/
#     sudo rm -rf /etc/postgresql/

