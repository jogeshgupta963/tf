
variable "filename" {
	default = "/home/ubuntu/terraform/terraform-variables/dev-v.txt"
}

variable "content" { 
        default = "Autogen content"
}

variable "map_content"{
	type = map
	 default = {
		"jogesh" = "gupta"
		"gupta"="jogesh"
	}
}
variable "file_list"{
        type = list
         default = ["/home/ubuntu/terraform/terraform-variables/file1.txt","/home/ubuntu/terraform/terraform-variables/file2.txt"]
}
