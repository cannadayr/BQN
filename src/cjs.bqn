#! /usr/bin/env dbqn

compile ← •EX •path∾"c.bqn"
Comp ← ((<"runtime["∾⍕∾"]"˙)¨↕62)⊸Compile
FP ← ∞⊸=◶⟨⍕,"Infinity"⟩
Esc ← (⟨"\t","\n","\r","\'","\"""⟩∾<∘⥊)⊑˜("'"""∾˜@+9‿10‿13)⊑∘⊐⊢
Str ← "str("""∾(∾Esc¨)∾""")"˜
Char ← "'"(∾∾⊣)Esc
Fconst ← ≡◶⟨(⊑⍋)∘(∾⟜∞)◶⟨0⊸≤◶⟨"-"∾FP∘|,FP⟩,Char⟩⋄Str⋄⊑⟩
L ← "["∾"]"∾˜1↓·∾","⊸∾⟜⍕¨
J ← ∾∾⟜(@+10)¨
Fout ← ⟨⊢,Fconst,L⟩ {L𝕎¨𝕩}¨ ⊢
Frun ← ("provide.concat("∾∾⟜")")⌾(1⊸⊑) Fout
Long ← ∾ (1‿2/⟨"  new Uint8Array("∾∾⟜")"⋄((@+10)∾" ,")⊸∾⟩) {𝕎𝕩}¨ ⊢
• ← (⊑"r"‿"c"‿"fmt"⊐⊏)◶⟨
  {𝕩⋄Long Frun {𝕩⊸↓⌾(1⊸⊑)Comp𝕨}´ •EX •path∾"pr.bqn"}
  {𝕩⋄Long Fout Comp J •LNS •path∾"c.bqn"}
  {𝕩⋄Long Fout Comp J •LNS •path∾"fmt.bqn"}
  ¯1 ↓ · J L∘Fout∘Comp¨
⟩ •args
