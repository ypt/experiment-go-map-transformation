# Generate many rows of data that look similar to this:
# READ_ssssssssss,UPDATE_tttttttttt,UPDATE_dddddddddd,UPDATE_vvvvvvvvvv,UPDATE_uuuuuuuuuu|1,UPDATE_gggggggggg,DELETE_zzzzzzzzzz,UPDATE_tttttttttt,UPDATE_oooooooooo,CREATE_vvvvvvvvvv,CREATE_qqqqqqqqqq,DELETE_aaaaaaaaaa,UPDATE_uuuuuuuuuu,CREATE_pppppppppp,DELETE_tttttttttt,CREATE_mmmmmmmmmm,READ_mmmmmmmmmm,READ_iiiiiiiiii,READ_yyyyyyyyyy,READ_ssssssssss,CREATE_eeeeeeeeee,READ_jjjjjjjjjj,READ_uuuuuuuuuu,READ_tttttttttt,CREATE_iiiiiiiiii,UPDATE_nnnnnnnnnn,DELETE_qqqqqqqqqq,DELETE_gggggggggg,DELETE_dddddddddd,READ_bbbbbbbbbb,CREATE_aaaaaaaaaa|62,CREATE_uuuuuuuuuu,READ_aaaaaaaaaa,UPDATE_uuuuuuuuuu,DELETE_iiiiiiiiii,DELETE_oooooooooo,READ_uuuuuuuuuu,READ_ffffffffff,UPDATE_xxxxxxxxxx,DELETE_yyyyyyyyyy,UPDATE_nnnnnnnnnn|85,DELETE_kkkkkkkkkk,DELETE_uuuuuuuuuu,READ_yyyyyyyyyy,DELETE_gggggggggg,CREATE_kkkkkkkkkk,READ_ffffffffff,DELETE_yyyyyyyyyy,DELETE_eeeeeeeeee,DELETE_tttttttttt|38,READ_ssssssssss,DELETE_mmmmmmmmmm,READ_uuuuuuuuuu,UPDATE_tttttttttt,DELETE_xxxxxxxxxx,UPDATE_eeeeeeeeee,DELETE_jjjjjjjjjj,UPDATE_oooooooooo,DELETE_ssssssssss,CREATE_wwwwwwwwww,UPDATE_nnnnnnnnnn,READ_hhhhhhhhhh,CREATE_rrrrrrrrrr,UPDATE_dddddddddd,READ_dddddddddd,CREATE_zzzzzzzzzz,DELETE_ffffffffff,UPDATE_rrrrrrrrrr,DELETE_aaaaaaaaaa,CREATE_gggggggggg,READ_bbbbbbbbbb,READ_kkkkkkkkkk,DELETE_dddddddddd,READ_mmmmmmmmmm,UPDATE_llllllllll,CREATE_xxxxxxxxxx,UPDATE_bbbbbbbbbb,READ_wwwwwwwwww,UPDATE_cccccccccc,CREATE_eeeeeeeeee,DELETE_cccccccccc,UPDATE_zzzzzzzzzz,READ_iiiiiiiiii,READ_jjjjjjjjjj,CREATE_oooooooooo,DELETE_eeeeeeeeee,CREATE_mmmmmmmmmm,UPDATE_aaaaaaaaaa

PREFIXES = ['CREATE_', 'READ_', 'UPDATE_', 'DELETE_']
SUFFIXES = ('a'..'z').to_a.map { |s| s * 10 }
ALL_COMBINATIONS = PREFIXES.map { |p| SUFFIXES.map { |s| p + s } }.flatten

NUM_TRIALS = 100000
MIN_NUM_FILTERS = 1
MAX_NUM_FILTERS = 9
MIN_NUM_DOMAINS = 1
MAX_NUM_DOMAINS = 4
MIN_NUM_DOMAIN_PERMS = 1
MAX_NUM_DOMAIN_PERMS = 103

NUM_TRIALS.times do
  # The list of requested permissions - i.e. the filter
  line = ALL_COMBINATIONS.sample(rand(MIN_NUM_FILTERS..MAX_NUM_FILTERS)).join(",")

  # The permissions by domain - i.e. the data to be filtered
  (rand(MIN_NUM_DOMAINS..MAX_NUM_DOMAINS)).times do
    # The domain id
    line += "|#{rand(100)},"

    # The permissions for the domain
    line += ALL_COMBINATIONS.sample(rand(MIN_NUM_DOMAIN_PERMS..MAX_NUM_DOMAIN_PERMS)).join(",")
    puts line
  end
end