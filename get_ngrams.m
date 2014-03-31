function [ n_u,ng ] = get_ngrams( textfile,ngrams )
    %Given Text File, returns all nGrams [HELPER Function]
    % n_u = unique n grams
    % ng = all n grams
    textfile1 = fileread(textfile); 
    textfile1 = regexprep(textfile1,'\s+',' '); %Replace multiple spaces with 1 space
    textfile1 = regexprep(textfile1,'[^A-Za-z ]',''); %replace everything except chars
    textfile1 = lower(textfile1); %standardize to lower case
    char_array1=strread(textfile1,'%s','delimiter',' '); %split by whitespace
    A1 = hankel(1:numel(char_array1),1:ngrams);
    ngrams1 = char_array1( A1(1:numel(char_array1)-ngrams+1,:) );
    cellRows1 = mat2cell(ngrams1,ones(size(ngrams1,1),1),size(ngrams1,2)); 
    ngrams1 = cellfun(@strjoin,cellRows1,'uni',0);
    n1_u = unique(ngrams1);
    
    ng = ngrams1;
    n_u = n1_u;
end

