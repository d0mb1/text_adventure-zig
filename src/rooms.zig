const std = @import("std");
const main = @import("main.zig");

pub const Room = struct {
    ID: i8,
    name: []const u8,
    description: []const u8,
    image: []const u8,
    // enemies: []main.Monster,

    pub fn print(self: Room) !void {
        const stdout = std.io.getStdOut().writer();
        try stdout.print("{s}\n\n", .{self.name});
        try stdout.print("{s}\n\n", .{self.image});
        try stdout.print("{s}\n\n", .{self.description});
        // try stdout.print("There are {} enemies\n", .{self.enemies.len});
    }
};

pub const entrance: Room = .{
    .ID = 0,
    .name = "ENTRANCE",
    .description = "You are looking at a huge wooden door reinforced with antient steel.",
    .image =
    \\(>]])[*>-([]((~-*  +-~- +                                : .~>-.+***~*-+>(]*^<::
    \\{}]>=*:+#{]+^[][]](] +     -     -<))))))<<<>>*.       .     + ([[^][[}}<[>+[:+<
    \\>{}(]>>~*^>+::~->)  ~  =   :+]]]]][[[][[]]]]]]]((((>-    <+:  -:     }{{+ >)>+)}
    \\{](](>*^*>.*-+]} -. =   :}}}}}}{}}}}}[[[[][[[[}[}}}[[[[> : ~.= -->~* :)+   )}{:}
    \\%{){#])(<<=([}.~::+* :[{{{##{{}]){<>+^+>^=+**^^[)([}{{}}}[^*^ +^.:=.((#-}: >*=] 
    \\){{)]%%###[[->^^    {#{###{[<<*-*^)][[}}}{}{]<()<^*^}[{{{{{[* - -+~.{  :)}[[(##{
    \\*{>~*^()(~] ^* -<:^####{[])<^^]]{##{{{{{{{{{{{{{{[)[+*<{[{##{}~* *.( <#= <}#<)){
    \\[((>^)<^+(-^ . -^##%#{])*-%([##################{{{#{}>>+=))}###]) +)*+*])]]><)} 
    \\[[(})[^=}+>^:: <#%{}((^~.>}####%#%################%##{[>+-=)]}##)-++=(*^[[[#=. -
    \\}]))<{}}<]*<  <##{]@^~ +<####%%%###{#{}}%{{{#{#####%####<>~>^^[}#^)--]+^]-+..^=+
    \\<(-~+[[(<*>*-+##{()=~=[{###%%%##{{[[[]])#]{[{}}}{########(-=+<((}#}*=:<+)])^].>#
    \\})< :][[{>.=~}{@[^=+-*]##%%%#{}[[()<]<(*%^{([]][[[{##%%%#%]-****][#)=~^<)>)))^%%
    \\([]** (]#}^ ]}[]>=>>%{##%%#{#}<>)>+*=<<:%+[*<)<()((#{{%%%#}*~ *=^)]}><^()]]<)%%}
    \\)}#{(+]<>+ =#{<>~*+ =##%%#{{#(>^>+~=-+~ @ ]~+>*>^^){]{{#%%{(  =^~*<}#(:))){##%)]
    \\#()}^}[[<(-*])>-+  #]{#%#{[[%[^=++:~^=  % ]=)*=^*^+<%%[}#%%[  : :-^[>^(<(}##=:}}
    \\+~%%%[#(<<~]]]+  >.:(}##}[[(() ~=~%.    % <.}=-}<* ^%)(]^{%>    >^^)>^)[([[<+~-(
    \\=:%%@%}<(][^):.     ([%{{>}(<*)+>*~><<}(%[>@=(=~+~<^*)]<%{#+*       <@#%%#[%%##%
    \\{~%%%##)<(((%%%%%#%##{(+}[<):]%*=~: .:  @ ]-(:.-* ])-<){[]}%%%%%#%%%] >*<<]}%%%)
    \\+>%@%#([>[ (%%}{%#(%##%#}(>>%}+~:...{   @ }.(=.-*.*[>))(}#%%}{[{>[[{]-(>(^)}{#]<
    \\^+%%#{[[](.({#{#%###=%%#[)(#(#*-~    . .# [ >:.:*)>[+)<(({@{{{=((=#%]:}}()[{}>()
    \\[^%#}[]=[* (##{[}}~#})#{}(>^^%+-- .=~+ -% { *-~.>^<]<<))[{#(^)<[{}{#{%#%##{{#+}]
    \\([*}{{}{[^:)#%[>~~*]}{#}[(<^*+~-..)#> ]<#~{-).-~<-^+>)>(]}#[}*^~<{@(^-][>})[})]%
    \\]^~)}}[}[^*<#}^*=={#{{#}]()^^+#~:*(>@{#<@)#-})*~<>>})<<]#}{}^  =})#})[+[#([{}%%-
    \\{{{(##{@#[*^]{>  -+>([#}]])<^+=~-:>@[[]}#-#=}-^+[*<)<<<([}#^    ^){{):>*]}{}]}+:
    \\[*<=[[##{[[{<[<^~~.]<(#}(()<)++=- =}{{#^#=#~}**>}^<><((}]}{^  +< ^{{}=#<[]]{][((
    \\)<~.]}](]}*)[}>^ >:+()#}[]((<)+>+-+^<^^<%*#*]<)<)<>([((]}[#) ^  =]{()-~*][{{[]>*
    \\))]{}#[]#}({[{]^}>:<}]#{]((({]>+++*^:>+>%*%^]<)^))>]{)][}}#]) +:-*#([+<]#{#%{{]#
    \\)))}{##@[])[%#]{--)([}#}[]]#<#}><^^>]>=+%^#>[<]*)>>}(#[[[{#<::++~<@{%<]{(}{%%%{#
    \\}[{{}{#{}}<]{{{>)=*{}}#[%#[(^[(*>[>>)>*=#-))](<>#(]{)]>{)[{<>>~)*}#}]<^>([(=<<[%
    \\{{{{([{#{{}[}#})>*->(+%{}{}]([[([{@(%)##{}@}#}[]%%[{{[[}#}}^<-==[]#}{<<]%#]<#(]-
    \\#{#^)]#[%[]}}(^-    -~]{{}[#]]](()())<]<#){]{(()]]}}}{}}{}:{       }]))#[{{][]{[
    \\%%}{{#%#[[}[{##[ :  }[}]}}[}{#]]]<<)@)>>%){]{#][][]}#]}{}=[^<}[]^ ^]}[}#{#{{}>][
    \\]<>)%%#%##{}{{#{{{{#}*}{#{[}[{}[(>()>[(*%*#]@<)[]]{{}}}}#{)~])[[]}[}[[}#%##[}]]}
    \\{]<*:: #{%{<^=-..  )]}]{]}{}{##][<@(}@@%%%%@%#@%@}{#{}{{][(}((-  .:-*)]{#{#}]][{
    \\()><=*^>=]+~     }{}#}(<]):-.  +     >      ]      )   .:)<]][[]*   ~-=(]{{#{[{}
    \\{[]^[)}{}{}{){]={{{}#]^>      >     :        .      )   :~+)[]#{{[:-*=^))[[##@}{
    \\{####%##{{%##%{###]^)<]])<*>^+^+: = -        >> #{)-{[[(]]()<)]%#{}##{#{##}}}##{
    \\%###%#%#%%{]]}[}{[]])>(}    ]    ^   >     >(^)]]      :)>})()(([{##%#@%#{}}[}{{
    \\####%%%%#[{}]}([})}{}+  -]<   :      *    ]^^   .++  ).:. )]])](])([][[([}[{}{{{
    \\%%%%%#}{{}{][}[[[([{##:..={]   ^{#  +. ]+ .-~=)~. <.:-}(~~+](]<))()(]]][[}[}{}#{
    ,
};
