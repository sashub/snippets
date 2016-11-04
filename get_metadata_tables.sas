  data work.tables (keep=uri name);
    length uri name $256;
    n=1;
    do while (metadata_getnobj("omsobj:PhysicalTable?@Id contains '.'",n,uri) >= 0);
      if metadata_getattr(uri, "SASTableName", name)=0 then output;
      n+1;
    end;
  run;
