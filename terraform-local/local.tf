resource "local_file" "devops"{
	filename = "/home/ubuntu/terraform/terraform-local/devops_tf.txt"
	content = "I am a Devops Engineer"
}

resource "random_string" "ran-str" {
	length = 16
	special = true	
}

output "ran-str" {
	value = random_string.ran-str[*].result
}
