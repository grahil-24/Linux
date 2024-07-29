

- hosts: all
  become: true
  tasks: 
    - name: create admin user
      tags: always
      user: 
        name: admin
        groups: root
   
    - name: add ssh key for admin
      tags: always
      authorized_key: 
        user: admin
        key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCn248AoFKk4HXkV80AsYVfu3ZG13ac22zt5hKOzvI/XT6VD4idANjzRuUrMoq9qtF9M/o3FrcOy5zpCROS1G6UxrtWvNqlb9WMUXrpTmIIVXU1hY1PeCr9PChMK0Pmi8sH216skixu3UKB9rMHN+bGmVVEeRL6KKPgDTIsAUdwpbEWAit/1iRfpek5yCMsi1HX41Snos39Hh3N8bOE6w0femLe3doIySffwMrY3H/QJ2fMtwrW/2M6TBYrCDMPRwPbp4VCgoC1QnxSs8EIHq7WyVyWfE17wd8ymn5r4nIYv8x65IfRVUWRHcWxMobklLa+SJI4XYw95m5vl5IfoGmvMiSg4960IdekTLYofz2vKeQyT4XJYN2Gk0PL/op8vFqejxM3KmbjAXhu4/LYcvpW6IRsfp9gqE6qXNbWEJDiL0odd7b+Cj/2sXR8h5iku3yir4Dk18FJTH1QwbGHKOGCexi4bP7fyHQqfDiHYivcvzApJnFSscJQuaMMaaiLMVU= rahil@fedora"


    - name: add sudoers file for admin
      tags: always
      copy: 
        src: sudoer_admin
        dest: /etc/sudoers.d/admin
        owner: root
        group: root
        mode: 0440


First tasks creates an  user named `admin` and add this user to the `root` group. 

Next, the playbook adds an SSH key for the `admin` user to facilitate secure, passwordless authentication

The final task involves adding a sudoers file for the `admin` user. This file, sourced from `sudoer_admin` on the control machine, is copied to `/etc/sudoers.d/admin` on the target machines. It sets the file's owner to `root`, group to `root`, and permissions to `0440`.