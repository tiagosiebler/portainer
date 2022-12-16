# Airbyte

The files all came from the airbyte repo:
https://github.com/airbytehq/airbyte#introduction

## Portainer steps
- Navigate to configs
- Create a new config called `airbyte_temporal.yaml`
- Paste the contents of `airbyte_temporal.yaml` from this folder.
- Create a new stack called airbyte
- Paste the contents of the docker compose in the editor. Notes:
  - server and webapp were renamed to airbyte-server and airbyte-webapp (thanks to @ASchmidtGit in https://github.com/airbytehq/airbyte/issues/19787)
  - this modified docker compose file refers to the "airbyte_temporal.yaml" config created in the previous step, instead of the local path used in the original docker compose from the airbyte repo.
- Load variables from .env file
- If desired, change basic auth username + password (currently set to admin:admin)

Once loaded, you should be able to visit airbyte via http://localhost:8000

I had to leave the startup running for a while before I stopped getting errors on the frontend.
