#Disables users not in whitelist

inp = open("/etc/passwd", 'r')
op = open("passwd", 'w')
whitelist = ["root", "student"]
for users in inp.readlines():
	if users.split(":")[0] not in whitelist:
		tmp = users.split(":")
		tmp[1] = "!x"
		op.write(":".join(tmp))
	else:
		op.write(users)
