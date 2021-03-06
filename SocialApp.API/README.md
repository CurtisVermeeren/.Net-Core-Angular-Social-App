## Environment Variables
This project uses the Secret manager to store variables.
The <UserSecretsId> section of <Property Group> defines which secrets are stored. 

The `AppSettings:Token` is used by jwt to give a secret key for signing tokens. 

The `ConnectionStrings:DefaultConnection` is used as a connection string to the database. Using a Sql Lite database.

The `CloudinarySettings` must be set to those in your cloudinary account. 

## Setup Secrets
Add a unique <UserSecretsId> to the <Property Group> tag in the .csproj file to use dotnet-secrets. This Secret id is a randomly generated GUID.

Edit the `SECRETS.TEMPLATE.json` file to configure your environment. 

Or use `dotnet user-secrets set "key" "value"` to add a secret to the dotnet user-secrets.

Use the command `type .\SECRETS.TEMPLATE.json | dotnet user-secrets set` to set the secrets from the template file to add multiple secrets at once.
  
The order of precedence from first to last loaded for secrets in .Net Core is as follows:
  - appsettings.json
  - appsettings.{env.EnvironmentName}.json file
  - The Local User secrets file
  - Environment Variables
  - Command Line Arguments
  
Items that are loaded LAST will overwrite previous settings. This means command line arguments will overwrite anything before it. 

## Seeding Users
Users can be seeded to add fake profiles for development. 
  
Users seeded using json-generator.com and in the `Data/UserSeedData.json` file.

Uncomment `seeder.SeedUsers();` in the `Congfigure` method of `Startup.cs` to seed the database with fake users. 

## APIs
Uses Cloudinary for image storage. An account is needed to run this application.

## Database setup

Application uses SQLLite for a database. This is called `SocialApp.db` in the project directory.

Recreate the database structure in `SQL Studio` using the `SCHEMA.sql` in the project directory.

See the `Seeding Users` section for information about seeding extra users. 

## Running the project
Once application setup is done above run the application using `dotnet run`

You can login with username: penny and password: password to use the application in development. 
