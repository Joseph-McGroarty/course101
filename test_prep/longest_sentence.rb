#split initial text into an array with split('.')
# iterate through each of those strings and call split on each element
  # could use .map
# will likely need to flatten array
# => have an one dimensional array of strings, each of which is a sentence.

# split each sentence into nested array of each word(els of large array are sentences, but arrays of words w/in them)
# determine the length of the longest sentence
# save length to output to screen later
# put sentence back together into string
# figure out how to get correct ending punctuation back onto screen. maybe use of .slice  ?

def longest_sentence(txt)
  sentence_array = txt.split('.')
  sentence_array.map! { |sentence| sentence.split('!') }
  sentence_array.flatten!
  sentence_array.map! { |sentence| sentence.split('?') }
  sentence_array.flatten!
  
  words_in_sentences = sentence_array.map { |sentence| sentence.split(' ') }

  longest_length = words_in_sentences[0].size
  words_in_sentences.each do |sentence|
    longest_length = sentence.size if sentence.size > longest_length
  end
  longest_sentence_array = words_in_sentences.select { |sentence| sentence.size == longest_length }[0]
  puts "=> The longest sentence has #{longest_length} words."
  puts "=> The longest sentence is:"
  puts longest_sentence_array.join(' ')
end

longest_sentence('Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure? We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live! It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground! The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced? It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.')