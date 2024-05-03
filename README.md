Change the grafana url and auth to your cloud instance on main.tf and run in a powershell terminal on the root directory of the repo the command 'terraform init' and 'terraform apply -auto-approve' with this, grafana is going to take the terraform configuration of resources and show the new organization + folder and dashboard

Install jsonnet with the following command 'go install github.com/google/go-jsonnet/cmd/jsonnet@latest'

From a powershell terminal inside the templates folder run the next commands after installing jsonnet:

Run the command 'jb init to start a jsonnet project'
Then run the command 'jb install github.com/grafana/grafonnet/gen/grafonnet-latest@main'

After initiating the jsonnet project and installing grafonnet lib run the next comand to compile the json from a jsonnet file:
'jsonnet -J vendor x.jsonnet -o target/output.json'

