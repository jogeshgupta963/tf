resource "local_file" "devops"{
	filename = "/home/ubuntu/terraform/terraform-variables/devops_test.txt"
	content = "Devops test file"
}
resource "local_file" "devops-var"{
        filename = var.filename
	content = var.map_content["gupta"]
}

resource "local_file" "devops-var-map"{
        filename = "/home/ubuntu/terraform/terraform-variables/devops_test.txt"
        content = var.map_content["jogesh"]
}

resource "local_file" "list"{
        filename = "var.file_list[0]"
        content = "List test file"
}
