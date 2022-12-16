# CircleCI Runners

Easiest way I saw was to make a docker file that extends the CircleCI runner and add logic to install any necessary dependecies (such as the node.js version I wanted).

## Portainer steps
- Build the docker file:= on the machine where the stack will be deployed:
```bash
docker build --file ./Dockerfile.circleci.node18 -t localbuild/circlecinode18 .
```
- Create a new self-hosted runner resource class in CircleCI. Example variables from CircleCI:
  - Namespace: `tiagosiebler`
  - Resource class label: `mycirunner`
- The previous step will give you a resource class token. Use this as the `CIRCLECI_API_TOKEN` in the docker compose:
  - CIRCLECI_API_TOKEN=yourResourceClassTokenHere
- Use the variables from creating the runner resource class to populate the `CIRCLECI_RESOURCE_CLASS` variable in the docker compose:
  - CIRCLECI_RESOURCE_CLASS=$tiagosiebler/mycirunner
- Start a stack using the modified docker compose.
