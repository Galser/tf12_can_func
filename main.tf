# define map var
#
variable "animal" {
	default = {
		rabbit = "white"
	}	
}

output "animal-banner" {
	  value = can(var.animal.rabbit)
	#	value = can(var.plant.maple)  --> this is going to fail BEFORE calling can function
}
