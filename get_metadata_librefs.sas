/* concise code to extract a list of librefs from metadata */

data work.libraries (keep=uri libref);
  length uri libref $256;
  n=1;
  do while (metadata_getnobj("omsobj:SASLibrary?@Id contains '.'",n,uri) >= 0);
    if metadata_getattr(uri, "Libref", libref)=0 then output;
    n+1;
  end;
run;
