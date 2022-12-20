# Firebase Web Hosting Setup

A non-convoluted, straightforward guide to setup firebase web hosting

### Navigation

- [Continuous Integration & Continuous Deployment with GitHub Actions](./CI-CD.md)

## Install Node.js

```
https://nodejs.org/en/download
```

Test if node is installed correctly by retrieving the version number from node.

```bash
node -v
```

## Install Firebase CLI

```md
# Firebase CLI reference
https://firebase.google.com/docs/cli
```

###### npm

```bash
npm install -g firebase-tools
```

###### standalone binary

Download the standalone binary for the CLI. Then, you can access the executable to open a shell where you can run the `firebase` command.

```
https://firebase.tools/bin/win/instant/latest
```

## Log in and test the Firebase CLI

```bash
firebase login
```

Test that the CLI is properly installed and accessing your account by listing your Firebase projects.

```bash
firebase projects:list
```

## Create a new project

1. Login to Firebase and create a new project. Give it a name.

2. Go to your project settings and register a web app to the project.

3. Run the following command to install the latest SDK
   
   ```bash
   npm install firebase
   ```

4. Initialize Firebase by copying the script code and pasting it inside the header of your `public/index.html` 
   
   ```javascript
   // Import the functions you need from the SDKs you need
   import { initializeApp } from "firebase/app";
   import { getAnalytics } from "firebase/analytics";
   // TODO: Add SDKs for Firebase products that you want to use
   // https://firebase.google.com/docs/web/setup#available-libraries
   
   // TODO: Replace the following with your app's Firebase project configuration
   // For Firebase JS SDK v7.20.0 and later, measurementId is optional
   const firebaseConfig = {
     //..
   };
   
   // Initialize Firebase
   const app = initializeApp(firebaseConfig);
   const analytics = getAnalytics(app);
   ```

5. Add SDKs for Firebase products that you want to use
   
   ```
   https://firebase.google.com/docs/web/setup#available-libraries
   ```

---

## Set up your domain for Hosting

Make sure that you've completed the "Get Started" wizard from your project's [Firebase Hosting page](https://console.firebase.google.com/project/_/hosting/main) so that you have a Firebase Hosting site in your Firebase project.

### **Step 1**: Add domain

1. From your project's hosting page, enter the wizard for connecting a custom domain:
   
   ```
   https://console.firebase.google.com/u/1/project/_project_name_/hosting/sites
   ```
   
    - If you have only one Hosting site, click **Connect domain**.
    - If you have [more than one Hosting site](https://firebase.google.com/docs/hosting/multisites), click **View** for the desired site, then click **Connect domain**.

2. Enter the custom domain name that you'd like to connect to your Hosting site.

3. *(Optional)* Check the box to redirect all requests on the custom domain to a second specified domain (such that `example.com` and `www.example.com` redirect to the same content).

4. Click **Continue** to initiate the validation process.

### **Step 2**: Verify domain ownership

If requested in the **Connect Domain** setup wizard, verify your apex domain.

These steps ensure that your domain is not already linked with a Firebase project and that you own the specified domain.

1. In your domain provider's site, locate the DNS management page.

2. Add and save a new record with the following inputs:
   
    - **Type**: Add a TXT record.
      
      Firebase Hosting requires that you keep this TXT record continually present in your DNS settings to prove your ownership of the domain and to authorize Firebase to assign and renew SSL certificates for your site.
      
      Your domain provider may list this term as "Record Type".
   
    - **Host**: Enter your [apex domain key](https://firebase.google.com/docs/hosting/custom-domain#domain-key).
      
      Proving your ownership of an apex domain, or root domain, proves your ownership of all its subdomains.
      
      Your domain provider may list this term as "Host Name", "Name", or "Domain".
   
    - **Value**: Copy the unique verification value into the field.
      
      Firebase Hosting checks for this value to prove your domain ownership.
      
      Your domain provider may list this term as "Data".

3. Allow up to 24 hours for propagation of your updated TXT records, then click **Verify**.
   
   Note that you may click **Cancel** to safely close the **Connect Domain** window and reopen at a later time. This does not affect the propagation time, but you will be prompted to [re-enter your domain name](https://firebase.google.com/docs/hosting/custom-domain#add-domain) when you reopen the window.
   
   After ample propagation time, clicking **Verify** in the **Connect Domain** window of the Firebase console allows you to begin the SSL certificate provisioning process.
   
   In most cases, propagation of your records and verification of your domain will happen within a few hours, depending on your domain provider. Refer to your domain provider's documentation for detailed instructions for adding TXT records and propagation times.
   
   If clicking **Verify** prompts an error message, your records have not propagated or your values may be incorrect.

**Note:** Feel free to check if your DNS records have updated correctly with the [G Suite Toolbox’s Dig service](https://toolbox.googleapps.com/apps/dig/#A/). Note that while your records have updated, more time may be needed for propagation or provisioning of the SSL certificate.

### **Step 3**: Go live

In the **Connect Domain** window of the Firebase console, select **Quick Setup** for a new site or **Advanced Setup** if you already have a site running on another hosting provider and need a zero-downtime migration.

#### Quick Setup

1. Return to your domain name provider's DNS management site to create DNS A records pointing your page to Firebase Hosting. Add and save records with the following inputs:
- **Type**: Add two DNS A records.  

- **Host**: Enter your [custom domain key](https://firebase.google.com/docs/hosting/custom-domain#domain-key) for both records.

The host you indicate is the domain on which you want to serve content; this domain can be an apex domain or subdomain.  

Your domain provider may list this term as "Host Name", "Name", or "Domain".

- **Value**: Assign one value to each DNS A record to point your domain to the specified IP addresses.
  Your domain provider may list this term as "Data", "Points To", "Content", "Address", or "IP Address".
3. Allow time for your [SSL certificate to be provisioned](https://firebase.google.com/docs/hosting/custom-domain#ssl-provisioning). This may take up to 24 hours after you point your A records to Firebase Hosting. In most cases, propagation of your records and provisioning of your SSL cerificate will happen within a few hours, depending on your domain provider.

#### Advanced Setup

1. The **Connect Domain** window of the Firebase console will request that you provide a token to migrate your existing site. You only need to complete one of the following to provide the token:
- **Update DNS TXT records**: Visit your domain provider's DNS management site. Add a TXT record with your [domain key](https://firebase.google.com/docs/hosting/custom-domain#domain-key) and the provided value.
  Allow up to 24 hours for propagation of your TXT records.- **Upload a file to an existing site**: Upload the token onto your existing site at the specified URL and verify its existence.

This page must be served over HTTPS and doesn't have to be valid or secure. The encrypted token is only valid for one try. If migration fails, a new token will be generated for your records.3. Allow time for your [SSL certificate to be provisioned](https://firebase.google.com/docs/hosting/custom-domain#ssl-provisioning). This may take up to 24 hours. In most cases, propagation of your records and provisioning of your SSL certificate will happen within a few hours, depending on your domain provider.
4. After your SSL certificate is provisioned, return to your DNS provider's DNS management site to add DNS A records pointing your page to Firebase Hosting. Add and save records with the following inputs:

- **Type**: Add two DNS A records.
- **Host**: Enter your [custom domain key](https://firebase.google.com/docs/hosting/custom-domain#domain-key) for both records.

The host you indicate is the domain on which you want to serve content; this domain can be an apex domain or subdomain.  

Your domain provider may list this term as "Host name", "Name", or "Domain".

- **Value**: Assign one value to each DNS A record to point your domain to the specified IP addresses.
  Your domain provider may list this term as "Data", "Points To", "Content", "Address", or "IP Address".

---

### Other reference Links

- [Get started with Firebase Hosting](https://firebase.google.com/docs/hosting/quickstart)
