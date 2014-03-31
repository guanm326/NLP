function [ output ] = P2( file1,file2,ngrams )
    warning off
    %First file for nGram Extraction
    [ n1_u,ngrams1 ] = get_ngrams( file1,ngrams );

    %We to use this to calculate the probability of a single word
    % which is required for probability chain rule
    [ n1_u_ref,ngrams_reference ] = get_ngrams( file1,1 );

    %Second File for sentence extraction
    textfile2 = fileread(file2); 
    textfile2 = regexprep(textfile2,'\s+',' '); %Take out multiple spaces
    textfile2 = regexprep(textfile2,'-',''); % take out hyphens
    textfile2 = regexprep(textfile2,'"',''); %take out qutoes
    textfile2 = regexprep(textfile2,'\.{3}',''); %Take out triple periods 

    sentences=regexp(textfile2,'\S.*?[\.\!\?]','match'); %Split file in to sentences

    %TRY with first sentences which has 3 words with ngrams greater than 3
    sentence_prob = zeros(size(sentences));
    %Loop Through Each sentence to calculate probability under MLE NGram Model


    for i=1:length(sentences)
        
        disp(i/length(sentences))
        %Sentence Extractions
        sentence = regexprep(sentences{i},' \.','.'); %replace ' .' with '.'
        sentence = regexprep(sentences{i},'\s+',' '); %replace multiple spaces
        sentence = regexprep(sentences{i},'\. \.',''); %replace '. .' with nothing
        sentence = regexprep(sentence,'[^A-Za-z ]','');% replace everything except alphabets
        sentence = lower(sentence); %lower case it

        if length(sentence) == 0
           continue 
        end
        
        %Split sentence to nGrams
        cell_array = strread(sentence,'%s','delimiter',' '); %split by white spaces
        A_idx = hankel(1:numel(cell_array),1:ngrams);
        ngrams_sentence = cell_array( A_idx(1:numel(cell_array)-ngrams+1,:) );

        %Calculate probabilities (Counting) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %First Word Probability
        prob1 = sum(ismember(ngrams_reference,cell_array(1))) / size(ngrams_reference,1);

        %Numerator
        numer = ngrams_sentence;
        cellRows1_nenom = mat2cell(numer,ones(size(numer,1),1),size(numer,2)); 
        numer = cellfun(@strjoin,cellRows1_nenom,'uni',0);

        %Denominator
        denom = ngrams_sentence;
        denom = denom(:,1:size(denom,2)-1);
        cellRows1_denom = mat2cell(denom,ones(size(denom,1),1),size(denom,2)); 
        denom = cellfun(@strjoin,cellRows1_denom,'uni',0);

        %Loop Through each numerator and denomination and calculate how many
        %times they occur
        prob_array =  zeros( 1,size(numer,1) );
    
        for j=1:size(numer,1)  
            cur_ngram_numer = numer(j);
            occurence_numer = sum(ismember(ngrams1,cur_ngram_numer));

            cur_ngram_denom = denom(j);

            if length(cur_ngram_denom) == 1
                occurence_denom = sum(ismember(ngrams_reference,cur_ngram_denom));
            else
                occurence_denom = sum(ismember(ngrams1,cur_ngram_denom));
            end

            % Probability of Part of Sentence
            prob_array(j) = occurence_numer / occurence_denom;
        end
    
        %Check if ngram is greater than current sentence length
        if isempty(prob_array) == 1
            sentence_prob(i) = 0; %Sentence Probability
        else
            final_prob = prod( [prob1,prob_array] ); 
            if isnan(final_prob) == 1 | isinf(final_prob) == 1
                sentence_prob(i) = 0;
            else
                sentence_prob(i) = prod( [prob1,prob_array] ); %Sentence Probability
            end   
        end
 
    end

    output = length( find(sentence_prob==0) ) / length(sentence_prob);


    

end

