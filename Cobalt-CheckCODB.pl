#!/usr/bin/perl
opendir(DIR, "/usr/sausalito/codb/objects");
@FILES=readdir(DIR);
@FILESSORT = sort { $a <=> $b }  @FILES;

$lastvalidoid = -100;
$i=0;
$lastdash = 0;
$oidslist = "";
foreach(@FILESSORT)
{
	if ($_ =~ /^-?\d/)
	{
		if($FILESSORT[$i+1] == $_ + 1)
		{
			if($lastdash == 0)
			{
				$oidslist .= "$_-";
			}
			$lastdash = 1;
		}else{
			$lastdash = 0;
			$oidslist .= "$_,";
		}
		$lastvalidoid = $_;
	}
	$i++;
}
if(substr($oidslist, -1, 1) == ",")
{
	chop($oidslist);
}

open FILE, ">myoids" or die $!;
print FILE $oidslist;
close FILE;
