# Github Action Runner

This was the easiest way I saw to get a per-repo github action runner fully working in a stack.

The startghrunner.sh script is the entrypoint for the container. Summary of the script:
- fetches a registration token for a user repo, but it could be modified to do it for a whole organisation.
- registers itself as an action runner using the provided personal access token from github.
  - this creates a registration token with a very short lifespan
- configures the github action runner to use the registration token
- starts the github action runner

The docker file fetches the github action runner and deploys it in an image with the start runner script. To build this image, you should be in the same folder as the startrunner.sh & Dockerfile.gh.runner scripts (use `cd`).

Building the image:
```bash
docker build --file ./Dockerfile.gh.runner -t localbuild/ghrunner .
```

## Portainer steps
- Build the image using the build command shown above, on the machine where the stack will be deployed.
- Prepare a personal access token in github
- Add a new stack in portainer, using the docker-compose.yml
- Add the following environmental variables to this stack:
  - `REPO`: `yourGithubUser/yourGithubRepo`
  - `TOKEN`: `yourGithubAccessToken`

The runner should start successfully, printing something similar to the following:
```
Calling runner registration on https://api.github.com/repos/tiagosiebler/poratiner/actions/runners/registration-token
--------------------------------------------------------------------------------
|        ____ _ _   _   _       _          _        _   _                      |
|       / ___(_) |_| | | |_   _| |__      / \   ___| |_(_) ___  _ __  ___      |
|      | |  _| | __| |_| | | | | '_ \    / _ \ / __| __| |/ _ \| '_ \/ __|     |
|      | |_| | | |_|  _  | |_| | |_) |  / ___ \ (__| |_| | (_) | | | \__ \     |
|       \____|_|\__|_| |_|\__,_|_.__/  /_/   \_\___|\__|_|\___/|_| |_|___/     |
|                                                                              |
|                       Self-hosted runner registration                        |
|                                                                              |
--------------------------------------------------------------------------------
# Authentication
√ Connected to GitHub
# Runner Registration
Enter the name of the runner group to add this runner to: [press Enter for Default]
Enter the name of runner: [press Enter for 14ef295ff347]
This runner will have the following labels: 'self-hosted', 'Linux', 'X64'
Enter any additional labels (ex. label-1,label-2): [press Enter to skip]
√ Runner successfully added
√ Runner connection is good
# Runner settings
Enter name of work folder: [press Enter for _work]
√ Settings Saved.
√ Connected to GitHub
Current runner version: '2.299.1'
2022-12-14 12:13:10Z: Listening for Jobs
```

This runner can easily be scaled using the replication feature in portainer (thanks to the dynamic registration process).
