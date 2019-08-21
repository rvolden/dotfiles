let g:airline#themes#light#palette = {}

let s:N1 = [ '#ffffff' , '#68b3b2' , 231  , 73  ]
let s:N2 = [ '#ffffff' , '#66737e' , 231  , 238  ]
let s:N3 = [ '#ffffff' , '#353d46' , 231  , 236 ]
let g:airline#themes#light#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#light#palette.normal_modified = {
      \ 'airline_c': [ '#68b3b2' , '#353d46' , 73     , 236     , ''     ] ,
      \ }

" #00875f
let s:I1 = [ '#ffffff' , '#00875f' , 231  , 29  ]
let s:I2 = [ '#ffffff' , '#66737e' , 231  , 238  ]
let s:I3 = [ '#ffffff' , '#353d46' , 231  , 236 ]
let g:airline#themes#light#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#light#palette.insert_modified = {
      \ 'airline_c': [ '#68b3b2' , '#353d46' , 73     , 236     , ''     ] ,
      \ }
let g:airline#themes#light#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#68b3b2' , s:I1[2] , 172     , ''     ] ,
      \ }


let g:airline#themes#light#palette.replace = copy(g:airline#themes#light#palette.insert)
let g:airline#themes#light#palette.replace.airline_a = [ s:I2[0]   , '#68b3b2' , s:I1[2] , 196     , ''     ]
let g:airline#themes#light#palette.replace_modified = g:airline#themes#light#palette.insert_modified

" #fcba56
let s:V1 = [ '#ffffff' , '#f99157' , 231 , 214 ]
let s:V2 = [ '#ffffff' , '#66737e' , 231 , 238 ]
let s:V3 = [ '#ffffff' , '#353d46' , 231 , 236 ]
let g:airline#themes#light#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#light#palette.visual_modified = {
      \ 'airline_c': [ '#68b3b2' , '#353d46' , 73     , 236     , ''     ] ,
      \ }


let s:IA1 = [ '#666666' , '#b2b2b2' , 242 , 249 , '' ]
let s:IA2 = [ '#8a8a8a' , '#d0d0d0' , 245 , 252 , '' ]
let s:IA3 = [ '#a8a8a8' , '#ffffff' , 248 , 255 , '' ]
let g:airline#themes#light#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#light#palette.inactive_modified = {
      \ 'airline_c': [ '#68b3b2' , ''        , 160     , ''      , ''     ] ,
      \ }

