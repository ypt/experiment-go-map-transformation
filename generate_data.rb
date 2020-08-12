# Generate many rows of data that look similar to this:
# READ_ssssssssss,UPDATE_tttttttttt,UPDATE_dddddddddd,UPDATE_vvvvvvvvvv,UPDATE_uuuuuuuuuu|1,UPDATE_gggggggggg,DELETE_zzzzzzzzzz,UPDATE_tttttttttt,UPDATE_oooooooooo,CREATE_vvvvvvvvvv,CREATE_qqqqqqqqqq,DELETE_aaaaaaaaaa,UPDATE_uuuuuuuuuu,CREATE_pppppppppp,DELETE_tttttttttt,CREATE_mmmmmmmmmm,READ_mmmmmmmmmm,READ_iiiiiiiiii,READ_yyyyyyyyyy,READ_ssssssssss,CREATE_eeeeeeeeee,READ_jjjjjjjjjj,READ_uuuuuuuuuu,READ_tttttttttt,CREATE_iiiiiiiiii,UPDATE_nnnnnnnnnn,DELETE_qqqqqqqqqq,DELETE_gggggggggg,DELETE_dddddddddd,READ_bbbbbbbbbb,CREATE_aaaaaaaaaa|62,CREATE_uuuuuuuuuu,READ_aaaaaaaaaa,UPDATE_uuuuuuuuuu,DELETE_iiiiiiiiii,DELETE_oooooooooo,READ_uuuuuuuuuu,READ_ffffffffff,UPDATE_xxxxxxxxxx,DELETE_yyyyyyyyyy,UPDATE_nnnnnnnnnn|85,DELETE_kkkkkkkkkk,DELETE_uuuuuuuuuu,READ_yyyyyyyyyy,DELETE_gggggggggg,CREATE_kkkkkkkkkk,READ_ffffffffff,DELETE_yyyyyyyyyy,DELETE_eeeeeeeeee,DELETE_tttttttttt|38,READ_ssssssssss,DELETE_mmmmmmmmmm,READ_uuuuuuuuuu,UPDATE_tttttttttt,DELETE_xxxxxxxxxx,UPDATE_eeeeeeeeee,DELETE_jjjjjjjjjj,UPDATE_oooooooooo,DELETE_ssssssssss,CREATE_wwwwwwwwww,UPDATE_nnnnnnnnnn,READ_hhhhhhhhhh,CREATE_rrrrrrrrrr,UPDATE_dddddddddd,READ_dddddddddd,CREATE_zzzzzzzzzz,DELETE_ffffffffff,UPDATE_rrrrrrrrrr,DELETE_aaaaaaaaaa,CREATE_gggggggggg,READ_bbbbbbbbbb,READ_kkkkkkkkkk,DELETE_dddddddddd,READ_mmmmmmmmmm,UPDATE_llllllllll,CREATE_xxxxxxxxxx,UPDATE_bbbbbbbbbb,READ_wwwwwwwwww,UPDATE_cccccccccc,CREATE_eeeeeeeeee,DELETE_cccccccccc,UPDATE_zzzzzzzzzz,READ_iiiiiiiiii,READ_jjjjjjjjjj,CREATE_oooooooooo,DELETE_eeeeeeeeee,CREATE_mmmmmmmmmm,UPDATE_aaaaaaaaaa

prefixes = ['CREATE_', 'READ_', 'UPDATE_', 'DELETE_']
suffixes = ('a'..'z').to_a.map { |s| s * 10 }
all_combinations = prefixes.map { |p| suffixes.map { |s| p + s } }.flatten

100000.times do
  # The list of requested permissions - i.e. the filter
  line = all_combinations.sample(rand(9) + 1).join(",")

  # The permissions by domain - i.e. the data to be filtered
  (rand(4)+1).times do
    # The domain id
    line += "|#{rand(100)},"

    # The permissions for the domain
    line += all_combinations.sample(rand(103) + 1).join(",")
    puts line
  end
end