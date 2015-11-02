function [ SI ] = splitInfo( Ds  )
%splitInfo : Returns splitInfo for a given array of split Data Samples
%|D1| is # of data samples through child node 1, |D2| etc. etc.
%[ D1 D2 D3....Dv] is input

val = 0;
D_tot = sum(Ds);
for j=1:length(Ds)
    val = val + (Ds(j)/ D_tot)*log(Ds(j)/D_tot);

end

SI = -1*val;