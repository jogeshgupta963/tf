
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
