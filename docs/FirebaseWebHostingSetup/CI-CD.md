# Continuous Integration & Continuous Deployment with GitHub Actions

1. Go to `your-project/actions`. Click `new workflow` then `...set up a workflow yourself`. This will create a workflow file for you in your `.github/workflows` folder. Alternatively, you can append the link data below. Change `main` to the branch you are creating the workflow for.

    ```
    your-project/new/main?filename=.github%2Fworkflows%2Fmain.yml&workflow_template=blank
    ```

3. Copy and paste the code below and save. This will run a deployment upon push to your main branch.

    ```yml
    name: Firebase Deploy

    on:
      push:
        branches:
          - main

      workflow_dispatch:

    jobs:
      build:
        name: Build
        runs-on: ubuntu-latest

        steps:
          - name: Checkout repository
            uses: actions/checkout@main
          - name: Install dependencies
            run: | 
              npm install
              npm ci
          - name: Build dependencies
            run: npm run build
          - name: Archive production artifact
            uses: actions/upload-artifact@main
            with:
              name: dist
              path: dist

      deploy:
        name: Deploy
        needs: build
        runs-on: ubuntu-latest

        steps:
          - name: Checkout repository
            uses: actions/checkout@main
          - name: Download artifact
            uses: actions/download-artifact@main
            with:
              name: dist
              path: dist
          - name: Deploy to Firebase
            uses: w9jds/firebase-action@master
            with:
              args: deploy --only hosting
            env:
              FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
    ```

3. To get the `FIREBASE_TOKEN`, run `firebase login:ci` to login to generate an access token. You should get a response like this:

    ```
    Visit this URL on this device to log in:
    https://accounts.google.com/o/oauth2/auth?client_id=...

    Waiting for authentication...

    +  Success! Use this token to login on a CI server:

    1//06Y...1fA

    Example: firebase deploy --token "$FIREBASE_TOKEN"
    ```

4. Copy the token provided by Firebase CLI and go to `your-project/settings/secrets/actions`. Add a new repository secret with the name `FIREBASE_TOKEN` and paste the token in the value field.
5. Test the workflow by pushing some code to the branch.
