function [ output ] = P3( textfile,ngrams,sen_length )
    warning off
    text_file = fileread(textfile);
    ngram_db = []; %array of struct indexed by number of ngrams
    
    %Database
    for n=1:ngrams
        disp(n)
        [ V,ngrams_holder ] = P3_ngram_helper( text_file,n );
        holder.vocab = V;
        holder.ngram = ngrams_holder;
        ngram_db = [ngram_db , holder];
    end
    
    [y, ~, idx] = unique( ngram_db(1).ngram );
    counts = histc(idx, 1:length(y));
    prob = counts / length( ngram_db(1).ngram );
    sentence = [];
    sentence = [sentence , randsample(ngram_db(1).vocab, 1, true, prob)]; %first word
    
    for i=2:sen_length
        disp(i)
        if length(sentence) < ngrams
            %Case when there are not enough ngrams
            %[ V,ngrams_holder ] = P3_ngram_helper( text_file,i );

            cond_prob = zeros( size(ngram_db(1).vocab) );

            for j = 1:length(ngram_db(1).vocab)
                numer =  sprintf('%s %s', strjoin(sentence,' '), cell2mat( ngram_db(1).vocab(j) ) );
                denom = strjoin(sentence,' ') ;

                number_of_words_numer = length(strsplit(numer));
                number_of_words_denom = length(strsplit(denom));

                numer_occurrence = sum(ismember(ngram_db( number_of_words_numer ).ngram, numer ));
                denom_occurrence = sum(ismember(ngram_db( number_of_words_denom ).ngram, denom ));
                cond_prob(j) = numer_occurrence/denom_occurrence;
            end

            sentence = [sentence , randsample(ngram_db(1).vocab, 1, true, cond_prob) ]; 

        else

            cond_sentence = sentence( (i-ngrams+1):(i-1) ); 
            cond_prob = zeros( size(ngram_db(1).vocab) );

            for j = 1:length(ngram_db(1).vocab)
                numer =  sprintf('%s %s', strjoin(cond_sentence,' '), cell2mat( ngram_db(1).vocab(j) ) );
                denom = strjoin(cond_sentence,' ') ;

                number_of_words_numer = length(strsplit(numer));
                number_of_words_denom = length(strsplit(denom));

                numer_occurrence = sum(ismember(ngram_db( number_of_words_numer ).ngram, numer ));
                denom_occurrence = sum(ismember(ngram_db( number_of_words_denom ).ngram, denom ));
                cond_prob(j) = numer_occurrence/denom_occurrence;
            end


            sentence = [sentence , randsample(ngram_db(1).vocab, 1, true, cond_prob) ];

        end

    end

    output = sentence;
    
end

