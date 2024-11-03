using TypographicUnits
using Unitful.DefaultSymbols
using Unitful
using Test

function Base.rationalize(q::Unitful.Quantity)
    u = unit(q)
    return rationalize(ustrip(q))u
end

@testset "TypographicUnits.jl" begin
    @testset "arithmetic with typographic units" begin
        # absolute = (pt, bp, pc, dd, cc, nd, nc, sp)
        # relative = (em, ex, px, en)

        @testset "mixed relative and absolute units (lengths)" begin
            # TODO: test that it errors when you try to add something else that isn't a unit

            # for x in absolute, y in absolute
            #     (3.4x + 2y//9)/4
            # end

            @testset "(3.4pt + 2pt//9)/4" begin
                @test rationalize(3.4pt + 2pt//9)//4 == (163//180)pt  # (3.4x + 2y//9)/4 = 0.9055555555555556 pt
            end

            @testset "(3.4pt + 2bp//9)/4" begin
                @test rationalize(3.4pt + 2bp//9)//4 == (13043//14400)pt  # (3.4x + 2y//9)/4 = 0.9057638888888888 pt
            end

            @testset "(3.4pt + 2pc//9)/4" begin
                @test rationalize(3.4pt + 2pc//9)//4 == (91//60)pt  # (3.4x + 2y//9)/4 = 1.5166666666666666 pt
            end

            @testset "(3.4pt + 2dd//9)/4" begin
                @test rationalize(3.4pt + 2dd//9)//4 == (189401//208260)pt  # (3.4x + 2y//9)/4 = 0.9094449246134639 pt
            end

            @testset "(3.4pt + 2cc//9)/4" begin
                @test rationalize(3.4pt + 2cc//9)//4 == (267079//312390)pt  # (3.4x + 2y//9)/4 = 0.8549537437177887 pt
            end

            @testset "(3.4pt + 2nd//9)/4" begin
                @test rationalize(3.4pt + 2nd//9)//4 == (26269//28890)pt  # (3.4x + 2y//9)/4 = 0.909276566285912 pt
            end

            @testset "(3.4pt + 2nc//9)/4" begin
                @test rationalize(3.4pt + 2nc//9)//4 == (30071//19260)pt  # (3.4x + 2y//9)/4 = 1.561318795430945 pt
            end

            @testset "(3.4pt + 2sp//9)/4" begin
                @test rationalize(3.4pt + 2sp//9)//4 == (5013509//5898240)pt  # (3.4x + 2y//9)/4 = 0.8500008477105034 pt
            end

            @testset "(3.4bp + 2pt//9)/4" begin
                @test rationalize(3.4bp + 2pt//9)//4 == (130859//144000)pt  # (3.4x + 2y//9)/4 = 0.9087430555555555 pt
            end

            @testset "(3.4bp + 2bp//9)/4" begin
                @test rationalize(3.4bp + 2bp//9)//4 == (163//180)bp  # (3.4x + 2y//9)/4 = 0.9055555555555556 bp
            end

            @testset "(3.4bp + 2pc//9)/4" begin
                @test rationalize(3.4bp + 2pc//9)//4 == (72953//48000)pt  # (3.4x + 2y//9)/4 = 1.5198541666666665 pt
            end

            @testset "(3.4bp + 2dd//9)/4" begin
                @test rationalize(3.4bp + 2dd//9)//4 == (152051863//166608000)pt  # (3.4x + 2y//9)/4 = 0.9126324246134638 pt
            end

            @testset "(3.4bp + 2cc//9)/4" begin
                @test rationalize(3.4bp + 2cc//9)//4 == (122608849//142877236)pt  # (3.4x + 2y//9)/4 = 0.8581412437177885 pt ≈ 46031164//53640545 pt
            end

            @testset "(3.4bp + 2nd//9)/4" begin
                @test rationalize(3.4bp + 2nd//9)//4 == (166569693//182549318)pt  # (3.4x + 2y//9)/4 = 0.9124640662859119 pt ≈ 104373716//114386659 pt
            end

            @testset "(3.4bp + 2nc//9)/4" begin
                @test rationalize(3.4bp + 2nc//9)//4 == (24105913//15408000)pt  # (3.4x + 2y//9)/4 = 1.5645062954309448 pt
            end

            @testset "(3.4bp + 2sp//9)/4" begin
                @test rationalize(3.4bp + 2sp//9)//4 == (108381985//127031722)pt  # (3.4x + 2y//9)/4 = 0.8531883477105033 pt ≈ 99669107//116819583 pt
            end

            @testset "(3.4pc + 2pt//9)/4" begin
                @test rationalize(3.4pc + 2pt//9)//4 == (923//90)pt  # (3.4x + 2y//9)/4 = 10.255555555555555 pt
            end

            @testset "(3.4pc + 2bp//9)/4" begin
                @test rationalize(3.4pc + 2bp//9)//4 == (147683//14400)pt  # (3.4x + 2y//9)/4 = 10.255763888888888 pt
            end

            @testset "(3.4pc + 2pc//9)/4" begin
                @test rationalize(3.4pc + 2pc//9)//4 == (163//180)pc  # (3.4x + 2y//9)/4 = 0.9055555555555556 pc
            end

            @testset "(3.4pc + 2dd//9)/4" begin
                @test rationalize(3.4pc + 2dd//9)//4 == (534158//52065)pt  # (3.4x + 2y//9)/4 = 10.259444924613463 pt
            end

            @testset "(3.4pc + 2cc//9)/4" begin
                @test rationalize(3.4pc + 2cc//9)//4 == (6375851//624780)pt  # (3.4x + 2y//9)/4 = 10.204953743717788 pt
            end

            @testset "(3.4pc + 2nd//9)/4" begin
                @test rationalize(3.4pc + 2nd//9)//4 == (592781//57780)pt  # (3.4x + 2y//9)/4 = 10.259276566285912 pt
            end

            @testset "(3.4pc + 2nc//9)/4" begin
                @test rationalize(3.4pc + 2nc//9)//4 == (52538//4815)pt  # (3.4x + 2y//9)/4 = 10.911318795430944 pt
            end

            @testset "(3.4pc + 2sp//9)/4" begin
                @test rationalize(3.4pc + 2sp//9)//4 == (60162053//5898240)pt  # (3.4x + 2y//9)/4 = 10.200000847710502 pt
            end

            @testset "(3.4dd + 2pt//9)/4" begin
                @test rationalize(3.4dd + 2pt//9)//4 == (50246//52065)pt  # (3.4x + 2y//9)/4 = 0.9650629021415539 pt
            end

            @testset "(3.4dd + 2bp//9)/4" begin
                @test rationalize(3.4dd + 2bp//9)//4 == (16082191//16660800)pt  # (3.4x + 2y//9)/4 = 0.9652712354748871 pt
            end

            @testset "(3.4dd + 2pc//9)/4" begin
                @test rationalize(3.4dd + 2pc//9)//4 == (54709//34710)pt  # (3.4x + 2y//9)/4 = 1.576174013252665 pt
            end

            @testset "(3.4dd + 2dd//9)/4" begin
                @test rationalize(3.4dd + 2dd//9)//4 == (163//180)dd  # (3.4x + 2y//9)/4 = 0.9055555555555556 dd
            end

            @testset "(3.4dd + 2cc//9)/4" begin
                @test rationalize(3.4dd + 2cc//9)//4 == (43949//48060)pt  # (3.4x + 2y//9)/4 = 0.914461090303787 pt
            end

            @testset "(3.4dd + 2nd//9)/4" begin
                @test rationalize(3.4dd + 2nd//9)//4 == (64764619//66851460)pt  # (3.4x + 2y//9)/4 = 0.9687839128719103 pt
            end

            @testset "(3.4dd + 2nc//9)/4" begin
                @test rationalize(3.4dd + 2nc//9)//4 == (18059099//11141910)pt  # (3.4x + 2y//9)/4 = 1.6208261420169432 pt
            end

            @testset "(3.4dd + 2sp//9)/4" begin
                @test rationalize(3.4dd + 2sp//9)//4 == (103547879//113850408)pt  # (3.4x + 2y//9)/4 = 0.9095081942965018 pt
            end

            @testset "(3.4cc + 2pt//9)/4" begin
                @test rationalize(3.4cc + 2pt//9)//4 == (54709//416520)pt  # (3.4x + 2y//9)/4 = 0.13134783443772208 pt
            end

            @testset "(3.4cc + 2bp//9)/4" begin
                @test rationalize(3.4cc + 2bp//9)//4 == (2191831//16660800)pt  # (3.4x + 2y//9)/4 = 0.13155616777105542 pt
            end

            @testset "(3.4cc + 2pc//9)/4" begin
                @test rationalize(3.4cc + 2pc//9)//4 == (34361//46280)pt  # (3.4x + 2y//9)/4 = 0.7424589455488332 pt
            end

            @testset "(3.4cc + 2dd//9)/4" begin
                @test rationalize(3.4cc + 2dd//9)//4 == (4333//32040)pt  # (3.4x + 2y//9)/4 = 0.13523720349563045 pt
            end

            @testset "(3.4cc + 2cc//9)/4" begin
                @test rationalize(3.4cc + 2cc//9)//4 == (163//180)cc  # (3.4x + 2y//9)/4 = 0.9055555555555556 cc
            end

        @testset "(3.4cc + 2nd//9)/4" begin
                @test rationalize(3.4cc + 2nd//9)//4 == (18059099//133702920)pt  # (3.4x + 2y//9)/4 = 0.1350688451680786 pt
            end

            @testset "(3.4cc + 2nc//9)/4" begin
                @test rationalize(3.4cc + 2nc//9)//4 == (35079683//44567640)pt  # (3.4x + 2y//9)/4 = 0.7871110743131116 pt
            end

            @testset "(3.4cc + 2sp//9)/4" begin
                @test rationalize(3.4cc + 2sp//9)//4 == (30578221//403443193)pt  # (3.4x + 2y//9)/4 = 0.07579312659267 pt
            end

            @testset "(3.4nd + 2pt//9)/4" begin
                @test rationalize(3.4nd + 2pt//9)//4 == (7415//7704)pt  # (3.4x + 2y//9)/4 = 0.9624870197300104 pt
            end

            @testset "(3.4nd + 2bp//9)/4" begin
                @test rationalize(3.4nd + 2bp//9)//4 == (1483321//1540800)pt  # (3.4x + 2y//9)/4 = 0.9626953530633438 pt
            end

            @testset "(3.4nd + 2pc//9)/4" begin
                @test rationalize(3.4nd + 2pc//9)//4 == (1347//856)pt  # (3.4x + 2y//9)/4 = 1.5735981308411215 pt
            end

            @testset "(3.4nd + 2dd//9)/4" begin
                @test rationalize(3.4nd + 2dd//9)//4 == (8613823//8913528)pt  # (3.4x + 2y//9)/4 = 0.9663763887879188 pt
            end

            @testset "(3.4nd + 2cc//9)/4" begin
                @test rationalize(3.4nd + 2cc//9)//4 == (24384343//26740584)pt  # (3.4x + 2y//9)/4 = 0.9118852078922435 pt
            end

            @testset "(3.4nd + 2nd//9)/4" begin
                @test rationalize(3.4nd + 2nd//9)//4 == (163//180)nd  # (3.4x + 2y//9)/4 = 0.9055555555555556 nd
            end

            @testset "(3.4nd + 2nc//9)/4" begin
                @test rationalize(3.4nd + 2nc//9)//4 == (12467//7704)pt  # (3.4x + 2y//9)/4 = 1.6182502596053998 pt
            end

            @testset "(3.4nd + 2sp//9)/4" begin
                @test rationalize(3.4nd + 2sp//9)//4 == (114475115//126222336)pt  # (3.4x + 2y//9)/4 = 0.9069323118849583 pt ≈ 50278879//55438403 pt
            end

            @testset "(3.4nc + 2pt//9)/4" begin
                @test rationalize(3.4nc + 2pt//9)//4 == (10534//963)pt  # (3.4x + 2y//9)/4 = 10.938733125649012 pt
            end

            @testset "(3.4nc + 2bp//9)/4" begin
                @test rationalize(3.4nc + 2bp//9)//4 == (16854721//1540800)pt  # (3.4x + 2y//9)/4 = 10.938941458982345 pt
            end

            @testset "(3.4nc + 2pc//9)/4" begin
                @test rationalize(3.4nc + 2pc//9)//4 == (7415//642)pt  # (3.4x + 2y//9)/4 = 11.549844236760123 pt
            end

            @testset "(3.4nc + 2dd//9)/4" begin
                @test rationalize(3.4nc + 2dd//9)//4 == (24384343//2228382)pt  # (3.4x + 2y//9)/4 = 10.94262249470692 pt
            end

            @testset "(3.4nc + 2cc//9)/4" begin
                @test rationalize(3.4nc + 2cc//9)//4 == (145577495//13370292)pt  # (3.4x + 2y//9)/4 = 10.888131313811245 pt
            end

            @testset "(3.4nc + 2nd//9)/4" begin
                @test rationalize(3.4nc + 2nd//9)//4 == (126451//11556)pt  # (3.4x + 2y//9)/4 = 10.94245413637937 pt
            end

            @testset "(3.4nc + 2nc//9)/4" begin
                @test rationalize(3.4nc + 2nc//9)//4 == (163//180)nc  # (3.4x + 2y//9)/4 = 0.9055555555555556 nc
            end

            @testset "(3.4nc + 2sp//9)/4" begin
                @test rationalize(3.4nc + 2sp//9)//4 == (122443974//11250755)pt  # (3.4x + 2y//9)/4 = 10.88317841780396 pt
            end

            @testset "(3.4sp + 2pt//9)/4" begin
                @test rationalize(3.4sp + 2pt//9)//4 == (655513//11796480)pt  # (3.4x + 2y//9)/4 = 0.055568525526258676 pt
            end

            @testset "(3.4sp + 2bp//9)/4" begin
                @test rationalize(3.4sp + 2bp//9)//4 == (3289853//58982400)pt  # (3.4x + 2y//9)/4 = 0.055776858859592014 pt
            end

            @testset "(3.4sp + 2pc//9)/4" begin
                @test rationalize(3.4sp + 2pc//9)//4 == (2621491//3932160)pt  # (3.4x + 2y//9)/4 = 0.6666796366373697 pt
            end

            @testset "(3.4sp + 2dd//9)/4" begin
                @test rationalize(3.4sp + 2dd//9)//4 == (53349293//897261724)pt  # (3.4x + 2y//9)/4 = 0.059457894584167066 pt ≈ 26930858//452939987 pt
            end

            @testset "(3.4sp + 2cc//9)/4" begin
                @test rationalize(3.4sp + 2cc//9)//4 == (4803551//967148763)pt  # (3.4x + 2y//9)/4 = 0.004966713688491787 pt
            end

            @testset "(3.4sp + 2nd//9)/4" begin
                @test rationalize(3.4sp + 2nd//9)//4 == (9595985//161849554)pt  # (3.4x + 2y//9)/4 = 0.059289536256615205 pt
            end

            @testset "(3.4sp + 2nc//9)/4" begin
                @test rationalize(3.4sp + 2nc//9)//4 == (80442667//113087410)pt  # (3.4x + 2y//9)/4 = 0.7113317654016481 pt ≈ 65653157//92296113 pt
            end

            @testset "(3.4sp + 2sp//9)/4" begin
                @test rationalize(3.4sp + 2sp//9)//4 == (163//180)sp  # (3.4x + 2y//9)/4 = 0.9055555555555556 sp
            end
        end

        @testset "single relative units (quantity)" begin
            # for x in relative
            #     9*(9x - 3.14x)
            # end

            @testset "9*(9em - 3.14em)" begin
                @test rationalize(9(9em - 3.14em)) == (2637//50)em  # 9*(9x - 3.14y) = 52.739999999999995 em
            end

            @testset "9*(9ex - 3.14ex)" begin
                @test rationalize(9(9ex - 3.14ex)) == (2637//50)ex  # 9*(9x - 3.14y) = 52.739999999999995 ex
            end

            @testset "9*(9px - 3.14px)" begin
                @test rationalize(9(9px - 3.14px)) == (2637//50)px  # 9*(9x - 3.14y) = 52.739999999999995 px
            end

            @testset "9*(9en - 3.14en)" begin
                @test rationalize(9(9en - 3.14en)) == (2637//50)en  # 9*(9x - 3.14y) = 52.739999999999995 en
            end
        end

        @testset "mixed lengths" begin
            # for x in absolute, y in relative
            #     y == en && continue
            #     5y//15 - 1x + 2.4y
            # end

            @testset "5em//15 - 1pt + 2.4em" begin
                @test 5em//15 - 1pt + rationalize(2.4)em == -1pt + (41//15)em  # 5y//15 - 1x + 2.4y = -1.0 pt + 2.7333333333333334 em
            end

            @testset "5ex//15 - 1pt + 2.4ex" begin
                @test 5ex//15 - 1pt + rationalize(2.4)ex == -1pt + (41//15)ex  # 5y//15 - 1x + 2.4y = -1.0 pt + 2.7333333333333334 ex
            end

            @testset "5px//15 - 1pt + 2.4px" begin
                @test 5px//15 - 1pt + rationalize(2.4)px == -1pt + (41//15)px  # 5y//15 - 1x + 2.4y = -1.0 pt + 2.7333333333333334 px
            end

            @testset "5em//15 - 1bp + 2.4em" begin
                @test 5em//15 - 1bp + rationalize(2.4)em == (-803//800)pt + (41//15)em  # 5y//15 - 1x + 2.4y = -1.00375 pt + 2.7333333333333334 em
            end

            @testset "5ex//15 - 1bp + 2.4ex" begin
                @test 5ex//15 - 1bp + rationalize(2.4)ex == (-803//800)pt + (41//15)ex  # 5y//15 - 1x + 2.4y = -1.00375 pt + 2.7333333333333334 ex
            end

            @testset "5px//15 - 1bp + 2.4px" begin
                @test 5px//15 - 1bp + rationalize(2.4)px == (-803//800)pt + (41//15)px  # 5y//15 - 1x + 2.4y = -1.00375 pt + 2.7333333333333334 px
            end

            @testset "5em//15 - 1pc + 2.4em" begin
                @test 5em//15 - 1pc + rationalize(2.4)em == -12pt + (41//15)em  # 5y//15 - 1x + 2.4y = -12.0 pt + 2.7333333333333334 em
            end

            @testset "5ex//15 - 1pc + 2.4ex" begin
                @test 5ex//15 - 1pc + rationalize(2.4)ex == -12pt + (41//15)ex  # 5y//15 - 1x + 2.4y = -12.0 pt + 2.7333333333333334 ex
            end

            @testset "5px//15 - 1pc + 2.4px" begin
                @test 5px//15 - 1pc + rationalize(2.4)px == -12pt + (41//15)px  # 5y//15 - 1x + 2.4y = -12.0 pt + 2.7333333333333334 px
            end

            @testset "5em//15 - 1dd + 2.4em" begin
                @test 5em//15 - 1dd + rationalize(2.4)em == (-1238//1157)pt + (41//15)em  # 5y//15 - 1x + 2.4y = -1.070008643042351 pt + 2.7333333333333334 em
            end

            @testset "5ex//15 - 1dd + 2.4ex" begin
                @test 5ex//15 - 1dd + rationalize(2.4)ex == (-1238//1157)pt + (41//15)ex  # 5y//15 - 1x + 2.4y = -1.070008643042351 pt + 2.7333333333333334 ex
            end

            @testset "5px//15 - 1dd + 2.4px" begin
                @test 5px//15 - 1dd + rationalize(2.4)px == (-1238//1157)pt + (41//15)px  # 5y//15 - 1x + 2.4y = -1.070008643042351 pt + 2.7333333333333334 px
            end

            @testset "5em//15 - 1cc + 2.4em" begin
                @test 5em//15 - 1cc + rationalize(2.4)em == (-619//6942)pt + (41//15)em  # 5y//15 - 1x + 2.4y = -0.0891673869201959 pt + 2.7333333333333334 em
            end

            @testset "5ex//15 - 1cc + 2.4ex" begin
                @test 5ex//15 - 1cc + rationalize(2.4)ex == (-619//6942)pt + (41//15)ex  # 5y//15 - 1x + 2.4y = -0.0891673869201959 pt + 2.7333333333333334 ex
            end

            @testset "5px//15 - 1cc + 2.4px" begin
                @test 5px//15 - 1cc + rationalize(2.4)px == (-619//6942)pt + (41//15)px  # 5y//15 - 1x + 2.4y = -0.0891673869201959 pt + 2.7333333333333334 px
            end

            @testset "5em//15 - 1nd + 2.4em" begin
                @test 5em//15 - 1nd + rationalize(2.4)em == (-685//642)pt + (41//15)em  # 5y//15 - 1x + 2.4y = -1.0669781931464175 pt + 2.7333333333333334 em
            end

            @testset "5ex//15 - 1nd + 2.4ex" begin
                @test 5ex//15 - 1nd + rationalize(2.4)ex == (-685//642)pt + (41//15)ex  # 5y//15 - 1x + 2.4y = -1.0669781931464175 pt + 2.7333333333333334 ex
            end

            @testset "5px//15 - 1nd + 2.4px" begin
                @test 5px//15 - 1nd + rationalize(2.4)px == (-685//642)pt + (41//15)px  # 5y//15 - 1x + 2.4y = -1.0669781931464175 pt + 2.7333333333333334 px
            end

            @testset "5em//15 - 1nc + 2.4em" begin
                @test 5em//15 - 1nc + rationalize(2.4)em == (-1370//107)pt + (41//15)em  # 5y//15 - 1x + 2.4y = -12.80373831775701 pt + 2.7333333333333334 em
            end

            @testset "5ex//15 - 1nc + 2.4ex" begin
                @test 5ex//15 - 1nc + rationalize(2.4)ex == (-1370//107)pt + (41//15)ex  # 5y//15 - 1x + 2.4y = -12.80373831775701 pt + 2.7333333333333334 ex
            end

            @testset "5px//15 - 1nc + 2.4px" begin
                @test 5px//15 - 1nc + rationalize(2.4)px == (-1370//107)pt + (41//15)px  # 5y//15 - 1x + 2.4y = -12.80373831775701 pt + 2.7333333333333334 px
            end

            @testset "5em//15 - 1sp + 2.4em" begin
                @test 5em//15 - 1sp + rationalize(2.4)em == (-1//65536)pt + (41//15)em  # 5y//15 - 1x + 2.4y = -1.52587890625e-5 pt + 2.7333333333333334 em
            end

            @testset "5ex//15 - 1sp + 2.4ex" begin
                @test 5ex//15 - 1sp + rationalize(2.4)ex == (-1//65536)pt + (41//15)ex  # 5y//15 - 1x + 2.4y = -1.52587890625e-5 pt + 2.7333333333333334 ex
            end

            @testset "5px//15 - 1sp + 2.4px" begin
                @test 5px//15 - 1sp + rationalize(2.4)px == (-1//65536)pt + (41//15)px  # 5y//15 - 1x + 2.4y = -1.52587890625e-5 pt + 2.7333333333333334 px
            end
        end
    end

    @testset "show typographic units" begin
        io = IOBuffer()
        result() = String(take!(io))

        show(io, (2pt + 4em + 6ex + 8px)/2)
        @test result() == "1.0 pt + 2.0 em + 3.0 ex + 4.0 px"

        show(io, 3.1pt - 4.3ex)
        @test result() == "3.1 pt - 4.3 ex"

        show(io, 3px + 4.0em)
        @test result() == "4.0 em + 3.0 px"

        show(io, 1cm + 1pt)
        @test result() == "7481//254 pt"

        show(IOContext(io, :compact => true), float(3cm + 4pt + 4em))
        @test result() == "89.3583 pt+4.0 em"
    end
end
