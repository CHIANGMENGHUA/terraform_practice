# Following Commands:

1. Initialize:

- just for first time, if you already initialized, \
  you can just start from step 2

  ```bash
  terraform init
  ```

2. Format (recommend) :

   ```bash
   terraform fmt
   ```

3. Validation:

   ```bash
   terraform validate
   ```

4. Plan the following actions (recommended) :

   ```bash
   terraform plan
   ```

5. Apply:

   ```bash
   terraform apply
   ```

   enter a value:

   ```bash
   yes
   ```

   - or without enter "yes" :

     ```bash
     terraform apply -auto-approve
     ```

## State uploaded Successfully!!!

If you want to delete your deployment:

```bash
terraform destroy
```

Enter a value:

```bash
yes
```

- or without enter "yes" :

  ```bash
  terraform destroy -auto-approve
  ```
