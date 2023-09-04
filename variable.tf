variable "filename" {
  default = "/root/one.tx"
  
}

variable "content" {
  default = [ 1, 2, 4, 5 ]
  type = list(string)
  
}


resource "local_file" "mechine1" {
  Name = var.filename
}


# object type
variable "bella" {
  default = {
    name = "nilesh"
    id = 256
    foodName = ["banana", "apple"]
  }

  type = object( {
    name = string
    id = number
    foodName = list(string)
  } )
}


#tuple
variable "kittey" {
  type = ([string, number, bool])
  default = ["hello", 8, true]
}