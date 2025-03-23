state("pun") {
	string16 flevel: 0x41166C;
}

state("pun", "EnglishNoCd") {
	string16 flevel: 0x41166C;
}

state("pun", "PolandNoCd") {
	string16 flevel: 0x41166C;
}

state("pun", "RussianNoCd") {
	string16 flevel: 0x412A94;
}

init {
  vars.flevel = "";
  print("my init size");
  print(modules.First().ModuleMemorySize.ToString());
  switch (modules.First().ModuleMemorySize)
  {
    case 13652896:
      version = "EnglishNoCd";
			print("EnglishNoCd");
			break;
    case 13668352:
      version = "RussianNoCd";
			print("RussianNoCd");
			break;
    case 13656064:
      version = "PolandNoCd";
			print("PolandNoCd");
			break;
 	}
}

start {
	return (current.flevel == "Intera.ceg");
}

split {	
	if (current.flevel != old.flevel) {
		print("old.flevel: " + current.flevel + " current.flevel: " + current.flevel);

	}
	if (current.flevel == "int-load.ceg" && old.flevel == "int-debrief.ceg") {
		return true;
	}
	return false;
}

isLoading {
	return false;
}