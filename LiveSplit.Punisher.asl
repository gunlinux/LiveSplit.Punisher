state("pun")
{
	string16 flevel: 0x412A94;
}


init
{
	vars.flevel = "";
}

start
{
	return (current.flevel == "Intera.ceg");
}

split
{	
	if (current.flevel != old.flevel) {
		print("old.flevel: " + current.flevel + " current.flevel: " + current.flevel);

	}
	if (current.flevel == "int-load.ceg" && old.flevel == "int-debrief.ceg") {
		return true;
	}
	return false;
}

isLoading
{
	return false;
}