function [ n1_u,n2_u,output ] = P1( file1,file2,ngrams )

    %Read In Files
    textfile1 = fileread(file1); 
    textfile2 = fileread(file2); 
    
    %Normalize and Clean File
    textfile1 = regexprep(textfile1,'\s+',' ');
    textfile1 = regexprep(textfile1,'[^A-Za-z ]',''); %replace everything except chars
    textfile1 = lower(textfile1); %standardize to lower case
    
    textfile2 = regexprep(textfile2,'\s+',' ');
    textfile2 = regexprep(textfile2,'[^A-Za-z ]',''); 
    textfile2 = lower(textfile2) ;
    
    char_array1=strread(textfile1,'%s','delimiter',' '); %split by whitespace
    char_array2=strread(textfile2,'%s','delimiter',' '); 

    %N-Gram Extraction and Normalization
    A1 = hankel(1:numel(char_array1),1:ngrams);
    A2 = hankel(1:numel(char_array2),1:ngrams);
    
    ngrams1 = char_array1( A1(1:numel(char_array1)-ngrams+1,:) );
    ngrams2 = char_array2( A2(1:numel(char_array2)-ngrams+1,:) );
    
    %Combine the cell columns in to white space separated words
    cellRows1 = mat2cell(ngrams1,ones(size(ngrams1,1),1),size(ngrams1,2)); 
    ngrams1 = cellfun(@strjoin,cellRows1,'uni',0);
    
    cellRows2 = mat2cell(ngrams2,ones(size(ngrams2,1),1),size(ngrams2,2)); 
    ngrams2 = cellfun(@strjoin,cellRows2,'uni',0);
    
    %Calculate which are not in which
    n1_u = unique(ngrams1);
    n2_u = unique(ngrams2);
    notIn = ~ismember(n2_u,n1_u);
    output = sum(notIn)/numel(n2_u);
end

