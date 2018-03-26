# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field. The
# names are in an encrypted form, though, using a simple (and incredibly weak)
# form of encryption called Rot13.

# Write a program that deciphers and prints each of these names .

names = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
]

def rot13(full_name)
  fixed = full_name.chars.map do |char|
    forward = (char.ord + 13).chr
    backward = (char.ord - 13).chr
    case char
    when 'a'..'m', 'A'..'M' then forward
    when 'n'..'z', 'N'..'Z' then backward
    else                         char
    end
  end
  fixed.join
end

names.each { |name| p rot13(name) }

# p rot13('Tregehqr Oynapu')
