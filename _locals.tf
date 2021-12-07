locals {
  endpoints = var.create ? var.endpoints : tomap({})
}