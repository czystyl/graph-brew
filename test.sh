# vercel env rm elo preview --yes
vercel env add ELO_MELO preview < test.txt

vercel pull --yes --environment=preview

cat .vercel/.env.preview.local