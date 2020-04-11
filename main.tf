provider "vscale" {
    token = var.vscale_token
}

resource "vscale_scalet" "avg_scalet" {
    make_from = "ubuntu_18.04_64_001_master"
    rplan = "small"
    name = "avg_rebrain"
    ssh_keys = [vscale_ssh_key.my_key.id, var.rebrain_ssh]
    location = "spb0"
}

resource "vscale_ssh_key" "my_key" {
    name = "avg_key"
    key = var.my_ssh
}

output "public_ip_address" {
    value = vscale_scalet.avg_scalet.public_address
    depends_on = [vscale_scalet.avg_scalet]
}