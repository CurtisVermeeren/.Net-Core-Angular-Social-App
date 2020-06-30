## Environment Variables
This project uses the Secret manager to store variables.
The <UserSecretsId> section of <Property Group> defines which secrets are stored. 

The `AppSettings:Token` is used by jwt to give a secret key for signing tokens. 

The `ConnectionStrings:DefaultConnection` is used as a connection string to the database. Using a Sql Lite database

## Setup Secrets
Add a unique <UserSecretsId> to the <Property Group> tag in the .csproj file.

Edit the `SECRETS.TEMPLATE.json` file to configure your environment. 

Use the command `type .\SECRETS.TEMPLATE.json | dotnet user-secrets set` to set the secrets from the template file

## Other
Users seeded using json-generator.com and in the `Data/UserSeedData.json` file.

Uncomment `seeder.SeedUsers();` in the `Congfigure` method of `Startup.cs` to seed the database with fake users. 