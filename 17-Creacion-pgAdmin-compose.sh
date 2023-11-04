version: '3'

services:
  db:
    container_name: postgres-database
    image: postgres
    ports:
      - "5432:5432"
    restart: always
    environment:
      POSTGRES_PASSWORD: 1234567
    volumes:
      - postgres-db:/var/lib/postgresql/data

  pgadmin:
    image: dpage/pgadmin4
    restart: always
    environment:
      PGADMIN_DEFAULT_EMAIL: admin2@gmail.com
      PGADMIN_DEFAULT_PASSWORD: 1234567
    ports:
      - "80:80"

volumes:
  postgres-db:
    external: true

# se debe crear la red para conectar los contenedores para que se puedan comunicar
