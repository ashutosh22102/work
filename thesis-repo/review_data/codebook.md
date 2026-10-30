# Codebook — systematic review "AI capabilities, dynamic capabilities and sustainable competitive advantage"

Code ONLY what the abstract (or the full text, where you are told to read it) actually states. Never infer results that are not reported. If an abstract is truncated, code only the visible text.

## tier
- `Core`: the study's empirical or conceptual setting is e-commerce, online/electronic retail, e-retailers, digital/online platforms or platform ecosystems, cross-border e-commerce platforms, live-streaming commerce, or an e-commerce supply chain.
- `Supporting`: any other industry or a general/multi-industry setting.

## design (one value)
`Survey` (questionnaire data, incl. PLS-SEM, CB-SEM, regression on survey data, multi-wave surveys) · `Conceptual` (theory development, frameworks, propositions, literature-based essays, descriptive articles) · `Qualitative/case` (interviews, case studies) · `Panel/archival` (secondary/archival/panel data of firms, quasi-experiments on archival data) · `Mixed` (explicitly combines quantitative and qualitative, or several methods) · `Formal model` (game-theoretic/analytical models).

## outcome (the main dependent variable; one value; precedence SCA > CA > FP > INNOV > RES > BMI > OTHER when several are equally central)
- `SCA`: sustainable/sustained/long-term competitive advantage or competitive performance explicitly framed as sustainable, or the balance of short-term returns and long-term growth.
- `CA`: competitive advantage, competitive performance, competitiveness, competitive positioning (not framed as sustainable).
- `FP`: firm/organisational/business/financial/operational/export/marketing performance, profitability, growth, business value expressed as performance, efficiency outcomes of the firm.
- `INNOV`: innovation outcomes, including innovation performance, new product (development) performance, product innovation, marketing innovation, digital product innovation.
- `RES`: resilience (organisational, strategic, supply chain, operational resilience).
- `BMI`: business model innovation / design / transformation as the outcome.
- `OTHER`: anything else (servitization, scalability, value propositions, implementation, user value, strategic decision-making, sustainability, entrepreneurial quality...).

## P1 — AI capabilities → competitive advantage / performance
Applies only if the outcome is SCA, CA, FP or INNOV (otherwise `na`, unless the abstract additionally reports an effect on performance/competitive advantage).
- `+` a positive association/effect of AI capability, AI use or AI adoption on the outcome is reported or proposed (direct, total or indirect).
- `0` the DIRECT effect of AI on the outcome is reported as not significant / weak and non-significant (even if indirect effects are positive), or no effect is found.
- `c` the authors explicitly frame the AI–advantage relationship as conditional / depending on circumstances (e.g. only when situated, only under certain market conditions, impact depends on competitive dynamics) without reporting a general positive effect.
- `-` the study emphasises that AI fails to create advantage, or that advantage claims are illusory/constrained (e.g. resource poverty prevents it, AI washing).
- `na` not addressed.

## P2 — dynamic capabilities explain the AI → outcome link
Counts as a dynamic or closely related higher-order capability: sensing, seizing, transforming/reconfiguring, agility (organisational, strategic, supply chain, marketing, decision-making), ambidexterity, innovation capability, service/business model innovation or transformation as a capability-building process, resilience as adaptive capacity, absorptive capacity, orchestration, strategic change/renewal, explicitly named "dynamic capabilities". Operational capabilities (e.g. marketing capabilities, IT capabilities, logistics performance) count ONLY if the authors frame them as dynamic or higher-order capabilities.
- `+` AI capability strengthens such a capability, or such a capability mediates/amplifies the AI → outcome link, or the study maps AI onto sensing/seizing/transforming.
- `0` the study tests such a capability and finds it does NOT mediate or is not affected.
- `c` the capability's role is explicitly conditional or AI acts only as a moderator of another capability path.
- `na` not addressed.

## S / Z / T (yes/no each)
- `S` sensing: identifying/assessing opportunities and threats, market/competitive/risk intelligence, exploration of markets, information processing for opportunity recognition, pattern recognition.
- `Z` seizing: mobilising resources to capture value — agility, decision making, service/marketing innovation, business model design, new offerings, adoption-based capability building, exploitation.
- `T` transforming: reconfiguration, business model innovation/transformation, strategic renewal/change, resource orchestration, digital transformation, servitization, organisational transformation.

## p3 — boundary conditions / enablers / constraints mentioned (list zero or more families)
`integration` (integration into processes, complementary assets, absorptive capacity, formalisation, culture, fit, supply chain/customer integration, cross-functional integration, knowledge governance) · `dynamism` (environmental dynamism, technological turbulence, uncertainty, competitive pressure/intensity, geopolitical shocks, competitive dynamics) · `data_infra` (data quality, digital infrastructure, readiness, digital maturity, security, explainability) · `cognition` (managerial cognition, leadership, sensemaking, entrepreneurial orientation, AI orientation, managerial capabilities) · `resources` (resource constraints/poverty, firm size/age/ownership/life cycle, financial slack, family involvement, SME limits) · `platform` (platform embeddedness, network effects, ecosystem conditions, data-driven learning) · `trust_ethics` (trust, ethics, privacy, bias, regulation, governance of AI, legitimacy, accountability, AI washing, institutional context) · `imitability` (imitability, diffusion of AI to competitors, democratisation, appropriability).

## Quality checklist (each 1 = met, 0 = not met)
- `q1` aim/research question clearly stated.
- `q2` explicit theoretical foundation named (RBV, dynamic capabilities, TOE, game theory, etc.).
- `q3` research design appropriate for the aim (and identifiable).
- `q4` sample/data/cases described transparently (sample size and type; for conceptual papers: explicit conceptual method/logic; for formal models: explicit model).
- `q5` analysis rigorous (named rigorous method with tests; systematic coding; explicit model; rigorous argumentation for conceptual work).
- `q6` conclusions supported by the reported data/arguments (not overstated).
- `q7` limitations discussed: `yes` / `no` ONLY if you can actually see whether limitations are discussed (full text read, or abstract explicitly mentions limitations); otherwise `not_assessable`. Never default to `no` just because an abstract is silent.

## country
Country or region of the sample/context as stated; "-" if not stated.
