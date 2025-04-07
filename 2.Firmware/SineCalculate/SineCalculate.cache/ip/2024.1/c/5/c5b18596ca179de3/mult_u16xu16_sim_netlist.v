// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Tue Nov  5 18:45:55 2024
// Host        : Desktop-NUC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_u16xu16_sim_netlist.v
// Design      : mult_u16xu16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_u16xu16,mult_gen_v12_0_21,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_21,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [31:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [47:0]NLW_U0_PCASC_EXT_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_21 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .PCASC_EXT(NLW_U0_PCASC_EXT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
GldLassLiODVgwPWl5GtUvNFVA+ZFVCFDhi7OrBop0rEIGOD7pGMQGd2XL5uXmDjnBa10M9DWskh
bTmllY5ovkWmM+NjjKYtf65BTGkYfwgKQ0A0l0q2oaCRiZEI98rgXRzWg4blHjn3F8mvlotras3b
gty58LDcqChRb34tHz4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YcKo5o/69htYDEreuDNtMbaQmtugz53TAiA3xMek1XTrggXZnceDK+Oacp9AwNeiNftWOxMl66sc
GrZixCPC4jC03qefsJitE5tQCfx9LEom/ln0gke2S5U676zqGFFkGD4igDSppP9+7smsit0JMNFB
3d9nJDwNXaerv07edmo26kGx6IsxHNmGjsmUd8FYgoMDNNDiTN40UA7rfTR1c5FwRoOUAPNW8x7l
lmsL+1mbpRU3rvmnc+tPlMZ9USQRFaWSLPznAatOpRgaHOa1J4DFd6nwIAGf3cDLilhq3YGA2oUb
qXHyz/+dnLIidWUJj1UPrzhk+3OEiFNdeXBKsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
g4qhHdak8eXxEqdympBtDM13xMJwZUSekBKApv5XlolRI2rR14IEYNQEcKRGlZyuFCmDRJDrEYWf
Eokybg18xq2N2hsq8nA4pvk6H9PXJmnhKoFcPeZ1j9mOnXNuEaOZnL6sA21bsPP7tTakNFG0eaXB
2vlDGYPDupMpXlylpEQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YIONylalBSo3oXqXlsOxHxbPAKbTQFLUkNcqhxYuBHSYbie+16iUZHVqekHM1nIPQ8A+NqZHT/Cn
bM+AOf7At893GAAiJmLAoJJQdHh7oO33naeJX4XJ6I+8adw4O4AucHf+iXdDTh+vT4ToH3pNI1H/
fg7BSszZg69zgY/QsPHraQkyFn3n6Pi12TK4KdE5CdqP1IapEJzDzFftP3QIdgztNEm32O7R9UAV
Qu6VW5iu2mw976oaaPRS7xQkeSuh8v3dIBFLuXEUwqgjFtQ1YItY1vsqSSX+qAtcmYqxSAn3rSTu
J315oxld+eYjvTtO32Qn2VPHVzfXPLCqIWAfbA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ggUMon3tDyL18D99zI+gQo2KEmq86nD/UnuCl2KfpNz4G8UqOi9eijpYl6B8kVrp4KbnZWqTmMMF
z/O87hlmFpp4opDcOruJ+qiiTBWsOzFIQR4QZlanEjh8iO0cwSFSAz5sXdE77BCjzgHI7D4UD4Mp
5DA2KyFTsWztU8ricXXTuH6tZLNTLcTvHzJkt/DfkjmJrDlkm0eRAXhG0MUvkNsk32qCBY9RY9AF
1rJxG2dj5ZCJ2l/vueboa3iQZt2OeB1EloxrJDFuQtvPAvA65BsTM387sUTttprjm7eb5Tm0FQU5
vVHNxCllfsk9jW0rLIKm7dBRCgOntC9jDiJa0g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q5sQqbKwLxjG5mFk9qs+sD0CQg8/2B7KTHpwf62hzJF+1CFbVJUQ6go3DO5L0L1mUNINJPIKzaAD
66tkeRifjCdb0XYOSTAxArc1zlCtOMwOn0aTyha/Uq8sc44kv2JFuUoIsn/Tl15lAT4q5PGV1fNq
fyS1evlpX2NGjZCT9kx21/uYFVn1ltB09OkXy1tz0sskN2eMyg54gf1l6cTR+xsVdY2hIoYfIVN9
H8DudSxoFGmVq3nTkLEuIBwpOzIdlqxG/+zUbvpOhAOprRojoI7OuuNVnv8kqbudzrZrZDK0HX1J
I5lc8/JLEOTV1hKGDSaSt1UBFUvr7e8cCqERRg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dpec57YobDtonbQ0UO1SM8G+H4LNYxSkwZ+IOdocIPgFV2eNfdKVGLe5M3kGiFH8cY+OBkva9enL
/OWjF9TA2LAxTndxgG5J0pfUvCDOVC48MZgZnIR8dOHrP7D6LGWfbebBGB9V1IoBt63/ke8Gi6uZ
oukujbRqqhLpZtf77LbVOpOjZYXM0v1IplnrAPnLmHL9Auh/wBXbYFGVV+VhmRndax/hdT5NuXTd
OGVqvHjKXMT4qzPWpaROPHYFYtTWznHqjj27TLk/z5Hdp0nlp4+Ebp4zIwYMnSpg5MVSetpPiSCZ
031Hd1PlF/YfYwbU1r9lJTGrVWMqi/+gd8KaCQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HlE05c2aGsR6rjiuATQqbaTq27Z8ZtyCoeTKodnH2OaArT49PLi5ZL6waWhdrvL68et08IAUs9t+
8aQnVdhvb/0fNHwtevhkpK8kJCPhJmdNdN0DS60RUdlb5/sgSQWjlxx4Yz5wWXrD3w3dhNQaJbzb
PdLh3ZWUZ+ldIzf3OmxXqghMZwvXkPIkeVkEZK5rBVF4df5DItd6+GOemFxXJmppL3ChWMcSlJD6
hgFBtCxft+usPb88sDNxtsPNBhH8Yeq+nZ3gc7A2wXdVKQugUXMV+/6MH4QJagSTzkjs2wVuXfk8
YQcZf8t0t2eS3XkCFdUszXwMtQ8YgrBWqnZp6aSas1JlXWWMk1d316/ym9sdD+dt36sxmIOjr/mr
lNnHAn9fdTEGDWsaXok7ujwI96+Jo6VVX3h+8Qo/6f9dvmB+j9wX01yLiteRc/klH0QWWPFrckTr
rxvZC+0DnkSyRPCISuHF9Op/7iDXfrGDXOIKpGzdPMaHMsKqIpG+QnAb

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fff66ZCQIGGWn4BfihDr7MvimxiiOWXc0eZBNa52g6soH+VWc7Xx3RJ4fuq721E6hCeRxrTK72LX
i9jipHmkI+YxSSUZyntNbeuF7P38Z8QWyEXrCSRJqnLKUeNwU2D2v692GIbbkPNs3o1/p6bS+PZV
fy4p7pkkxRTdZGKmGNuXlDtPr5DhZ0zFptZiF4rQKB5ebp50U6h6HWEJapeIaJRVwy77CM+u0fDT
4A/3o3rPHumuUTiliaQcm/1jofwW8Wyt/fEyoDeskyKFiJxA7nvXRFcO7dw8hnBN2by3mEq8uvFc
fsXjl6FQ6E8njLb3YPebcEhF2fiQl6tfqv3Xsw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TPuKSC49PXr1CyJdt/9jlK1AKgl9KP/2WJFt/Z7vtljlmD6IwyvQTKF40mFUq27M5Fuz/W4X5INe
/y1uccitx3VcJsarTiaoGT9S3DEmWfAhW9Z3EJmLNoB5WF+Gt3VSrbcIFx4bRg1NbAvCsu35cwJ8
qIEuedLHAD9VsRvFu3kQcKMgbKlMKJWQKJUShZN0gC0lrTnoVAzLqEKMNA0qhQg6q9MlU0GGAeTU
4OAGi9IXN69mtGYQcFgRHTN2cuQvbBPQfXj7zjLG/WzUgoqFUvAhtN5JMPKijnF83gwj845lsPtD
BdmC4FzXoM7Od2ck/qbMAIXHv6TTsjznVFUQBg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dz0VP1CnlNHH+A6VEdv/MzTzitzJy9mXlBCOCHhiN+w9HtFx0dUiXe3p32oSt/JL5Z+78HPWFZNr
norYJdshbBxv2VA+Qb4W2FkhsUt+nbeUxZGkOXoHhhGec2Yij8F+xw2PzGlLK+EcjoVFUGoblbgy
lZxtUK/qPijjN/wQqhHPSvrKrho4ht3zcjZjVg8ZVfzx3x04m5pTyiTrTQecuIFEiVC5ZAhCQMxN
lUXGjCmiY2z772Cy8Zi5NhUXuo2561aTzEHBTJmriI9CVs50fIl0kofkrrA0OdX5CS5GkPv09EPz
ZPD7/ZAVOXqA3AlDcqAsaheUQnXkFpEPunVR0w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5744)
`pragma protect data_block
82JgIPbrh9Rkj24+Y9+PH9HNPhwKNDoe5Z3aXP1D12x6dTZ8sRq5KNG4qe1hUJJj3KARd/5pKXKi
CcisXs2xjkDkaQdLBnNtVMt+skIAcJSCnU1EDGNNU933MMUdEQqG2vSrFFYa3JjNJg5j9jBfOjmV
ScM0svFO5nqBkHELOC7ByE8tbhWQ8oMLwgqH7K9ZgHyGOHE/SxPY6f/vWW7YhY/+rk70UKnLlaNM
SnPYLfdC6GabVAkxf1e/jOOhJhl1Tg1zJ7XzqVKBKkyoJSSGBMBN1KkDA+PZQDJF70bxrtmwDI5M
AVW1ZmF4cy63ahXIDql49dUMc7vw2Bm5blHR8fp5tCLziOc9L5qvEVN7MUeGS4jXUCYDP6YF+07B
6mGiTETeWxiQPAPbxSuqcE40DEc7F9IXPjywUmU/19O4ViBtfpRVwNfJIpfkh8MrR//QAtac6esl
9VO+k5qRNYvBQiMPk80krXBsqQXsjpiYL1VpQQ1gtjRIQynvO+dihp9vMTRnkKT3/on2tcq8YthO
sCHiaFMyb5Mclb85WmHH1l4vMyeCiNketPoqQmOd4bfVlOkla4Dp5i1yj7Dknk3fKdH4/0sLbhfX
zEhf7ArA4rwiBRNF5l+XhR/yP+YZL/ILdqLhUyGCFj8cPnp+TuoqMpdedCDtEdvJf+LJOMnblrjS
rOXX5jzPPve4SmVOTC/F4WseEwwgN9leUGLszdHX40FlUWfyBvkPzFhOUU5qDx6FJOOaArizf+Xh
aesFaYnpr2mrUrgBUgLkDQuvhXT8j7FDKZU7DfDNQW38dZIp08+zXwOeF8Vnh4zd3dAW5lhp2EnC
MTXqmvvXWEm5vnBGTctz8gUxP5xNX5SQtR961Mlar/gE2qcphsjJsnLkw2ffWdfkyXwFiNt5IQX6
hvY7cGlt1re3zyXXtLXVlTiRGhRIoyjXNnX6TH/z9+gG/bKoYFDk94JZzTSz07SO2s/8iZVVlDvn
8BAwx23OV/XMmIXCzwDfzN25GBpjWuvBWPBRMj9HHrgCXeCo8gEjDLopLnCmorHu1Ij1uE8ichPe
TOtgcXtk8GrTt64MCcL3UXHzIW8ehCDKSj2vJfmfTXbpTufNhtQd9O6td9I3rwx497OJv8vdy/72
KZlRwAzn7gAj/cYacwkK7eh6deWc1Ywt6wYKecPN1B1TqaKYnqY/9Dhk8/rKcqWulM6YPDKG7rNE
bhvG1k2MxCISppEM5kBdbXwlMM5GiUChnjs0VzlcD3aebTljlyCeKaf3XkwSbpz35olyAUEq5rAs
03z91THCMzRCCqdZnVXyPuc9bfz7GFtcDtKFsy+ecMBZEGJ6tx2UwquAdFRvSPVdZ7jCrIBnOWk9
hhA1W1ulqACLayFn5xdugxRtGx+3yx3+vNGA1oBJLBSFuxNgQFiG8n/NY5vXLfpk66ileECCdCc9
pLsG5dKqeuOYW0LggUYR7cvAZWsZVcTR6TF5H/u1YrWqDvJDO01HkevJCG3e2pTTjr+4Mg2PpBT6
voLtOfx8jNsC3azL7iqHMytwRbJRffSfxnlRsm3gHQIfop7XN8aypGSzdWIoqOEihUqYR2V99j+v
p7w1/fO2V2aMZRDKroLQwx+/87MoFqFt/ZXItwhhn2BQ3wPN2JFYtbDMxLhkO5OKMlV02eHtMym0
XzKdicSdl+4f92f6+LSprIAD0qQEL023F/tFOYLQ8wjGvpcY/4qf9kBRYOYO7qQJjNHGmCWXy8L5
cv61X9nkRSsvvvYRY3Ij8qZ2niIBOPLb0KYXPlKKzt1V7qwxK8OvPs6liK5pjBbRNS74jhJOsHeU
+gzygBCXELb3cLn7aw0ofAwJFE2uGQm3Q4Q5zk7sOyhZH+OjiTiv7QCGmCzujj+GnsHnC3Om+Qjh
yszhyg3Mu4sNFMHq2kTdTVrldH2chqq31Y/rq1usCykYUWgvtmCE+PLzoIWIqdbCUC0MqpfETVeC
8iIKkVSarB1Ov10Cl9yhCnTCbVjbKJpzAPeHPZDW3ZcQWJZF97ncmhJeVyg+fwhreybU11OJNFQ+
DuHwU9SaYokWFHbOac+TmVS1F/cIiPPAgnHvJYPgsHphpOFmnxMdGG2Rv563TdrLAzcndJvX3OXH
wIR44BgkFS7TbSwH8c9uZ7b+huhtJQPSdaS+ffSDScZVUjzZLGlFKlMtRys9Yzux0H79K26an2by
bI97JaWqsTLwSgmw4rFLDpGGSW9G4Du2Nn3vvueXxT70wVA+4kad8qjBmGenO9knk9kQQPl3wqOH
UkJfbcJRKdSpsAYDHlpGAWJdBYShenA32oFS6Tq9OVF3oJlJQ38ecdsFxVohOk/kpzFSw3IJyQTV
BsQsqhXVDVnTnIvOU4n0h5eds8GO+8/PHW9DO4H/NZ8swNcv0sAUHYi1VE5Fk2oJiJHKVrTwMsME
b4hd35Ma1yI8sxwKOh5GLHfDL3av+gHWxa3V+1VF/N4Z+Tzkzubp6bnCAA26LNk0X843OVOQWx4L
hmCipT9CW0CkwF8d+9ShjvbbvPto+6q4/l+Aa5oz/l8rR+WsC59Rjn+J5GKNlUqg7feQlkIyEQco
gfOqRE4JTIlxI1fCPijDZye4x5vtO4M/eNUGE8s/JHcXMPOvxrfozoYtX9QHy2PaaYA2QSrN+2xS
fjgzSQEJOKJU8/I/PF4g1w5HJFJF8uMJOZCUZfVUsor2vZ6SIoqCHLP/vz/Q4GfIheg5RzAlQGt1
cJMaFVF0GmncL80H8Zdv2LnbQcYpfL2VkTtqfIBCiDb5/c8Y+6pXYAqDhx/elTniFYI/2qJyQdrb
KZwa7NdLcR8eDHZMJUShJ44K1GZO+PM58Plx9WoTqfnEvt7xCGjauOeAYvaP0iWxk6wGzWaYLr3M
+bcYWnk9ZsHk7vmpcSmfXgYgv2XESnpncZMYXjaOKoE7t7oYkTR5d8rN6xtu/r5buzc/4Khy8g8e
QeC7Ic3j8n3XownYVFM0hDrWDkLAvEpTXVS8luNQmoc+hSQtAQyH12dT7XNbLxAgCvWbBMehuPvg
9HK1vHNvejlOD4/dPoUMu4amFdtnk7Nn33IvPQGzoM3K0VwlA+1JU5xO9VANYxwxCsUgiZvfak4l
iLKdPswbqaywxZdXQOM9A4XhYTtU5DVsLpHQq2QZNUsQykDVH5J6avj5ezM95hBeKMKWQmzTzVbj
nM2iM13cs4WusT7SQPtZJ6LhhC7/F0GVYUcv8jmR3qgne8MFFy/e0x3+hZRq9NjJ8iarfjtmxSAf
VeDXvqj6hJTTsIX1c0a0ICUpDZPUYPDmTLlZsDh3fXPqjOPk5H9ayLHj6vXv5GNGemHYto9UUcat
4LqT8hW0NdLa0ugoLJUkIIrPJLmupG79xvjIiItW5gwT3l1F1kV32RFh9LmSjp9wq4lx/ZsqMA6C
I54a6UOdDgVw+B3FL+D/YfjQMl92U58VQjEfDbQKm87eUIVZNdLTljAvxKxaaj13PyAIYJkq1iTu
ifONqLt8sDDX7wZXGhrGuFMn54bjRfxzwIoKg75R3TLcCAjEyrHPiwnWZTyxWLw2odzO1yLKzZCI
qVzQNHaTLYRX5cGvAsmLKw09qPk6TmcY7CffbyLpgi+ArB0vFNFNraDbgklM4inBqMPXUqWZcSP4
/CRCulF5FE6PWYgxTcrx3XFDvKw0bMipfWwjpktvXYdXrFc2ew0/A/pdLydxBOkj9YxMBtIxso+s
QIWPWvbjf08tjnlmBs5lOFks1k9oLXh/qAo6zEVQnUp9uRewuArL4bZGoJiNn1Krfhc2/UjQ8e7j
wA1cDGLYEPS1RtL7uK/+AXc6uuZe0LS4168syaVpxiuYqYtDLjLJadw/BxkGQuWEIIUGXoRIUAVz
nNPt6klK5C2N+wqgx7HuYBUBexEAlsdak6Op3CiMwgwSqsKoEM9SR2GqoCz9KGyN6hTOINV0PP7E
xAu9NKVSy9YoKwCt6f7g7bO1idkpuMf5noQI2S1AYzccXospMvHSPJJ3oY3bhxpGFT+hoSfcXgX5
WFuGTeH983KO7payi37YOzsFUhZJUiLpoADfClBWJ6KHaXqf+YMDFgXd5WMNJTiS/LPPztr6f9Mf
lkDOMy8YA5f68+bqzxD7wWkukOdgF4ml1No89ytBTen19S3VJL1G/gcGMAps8xFUfvfiuZTjwjyy
tAYrdS+64UQkwFlD4MpUs8IhjGspBEXIvprsH5ojzsNKS5qwfY5Y7BObFKCRbFrpEIEypLxMefyF
ZZg+wHrFRRrw/Z4wt6SSKLfbMVN+ELT5VBpXZqX5cDzRcRKAtaVMht1DgyQLop7da0jYiLP/iQb2
ODK0iaYus6XVwrhr/t+XHCo8DElrHnLhbNvzZvvWmp2gCJ85IhYP/XMK3k0rvgHgpLjstodDmmYq
4pYM07Ui1ae/KnSjzzBnF1Csczc4TEny9eG4ZyIbPZJG5e7RZvINqvcHUREeQRPyNdU/En4mqDpv
HHzXb+8KcXYvlOP6OS+3UJV3QQseA2NfsVr78e9EvUOboDQ5374WvwBprXMeyjEwD+AG24kjhQum
0kttM5cE4i8UQpeQkDQk2qC8dd+Ef6lxjfPcZvTeg2BX4PtNtpUpg0I+rrJ3LosiixX51TUnV5gL
nO1W21iIKQ0FDteGcADPxgITTkWtHe79oxynYKpKubqMbB35vebKlO4lz+SwlI1Txz4rmZULLyjq
2viEIe8b62n5kixL7H+ZkTavwK9Qheao/k2aE+hg6dhpGOinwsE5hTYUwvbYvMy8Vp8NJaYn1RoN
JYuRTO2aFLqGwhvWWvCQh/lzNgihD9UZy6fcZaLTD9hX30kkC7EHDGRQt6/cVoOU9aX9dtMZ/qxW
+73+tYAEKW2CSivjggAve1kQr/96b2YYwrwVG4IrCOJlcvyFk4X6J8gTk7KRoR2SLzkPa/aMQB4h
9izkr3aN67mmZz3SHRD4O2HhfbBVyf2gBeP844einmA7VdIRyMqxyuXl9vSpWtxUDfNwVVhL6xUm
n8JB1L5MsodDxp2BpeC7PMrom6mTWwWCS+57yTm+9a5MNxmJ+ulNn/xJBiZnhiu1sI/tUhLRa3ZN
SNLkKKt3QNMRrvESEHHqlkGLBnf2OHDPfm5qg3DafhqXbqqz7APKvXZggsTVJRNcpDBowvQFau4C
Co26J8P2HjZV9ajWpomM6MoY27Z7DIrhkBpmxVZc1FADQRcjx2N/s7ToIP5hsZN31lalomsK8A8K
MciVSgdlf1kpW/ehf7nHXAa95M+HzX7SQUv3FVqsR6VrAGXtZVz5pnmouDQGAvUjzi+p5Nc1C0pv
xUqHGndczGf90ozOsW1fYbmOhB2wVSX/Alv+Bd53gHgeyx2wqpApwbYXVUQiSGTNjnevKBMaF8HB
Z99gAp+HXGtubr1HP8MOPAjCKXCTd5tz3ZzVnQWfqpAqmvPMPWKTZyYx1qeIyd8YTYR6l+sI+Bvx
J2xIcBl6+uXAIfjQizP/SwZJ80sO+9ariuWgE0yQ8mO1sSG1GBl8Xk/KumIUy6yB5PFgLVm5ONyb
sYmD2IDxIXJ5R29+dYYkOTuOiwjIEWDBauGRN1czRyyiUVKQQ6U/W4ezuly1zXoJh2zVeQgj0cCa
8qN5ivRwKKejCiP4j737jWdhgQHB4mOgXAK9f0sYWiLf0o78FCRLrm2oyWlFu+BNiDSbueCtCuYn
Nvskm7Ti05OEbZS+DzPtqkpWPfThbVJOSUcNAgwUtK9OZ/LP9VKEmVRZLYwTwTxSWFT8UjRB38Tw
sib1PCd5ZhQpOJF12DgZUSyV4Nzpjmx+Gi4OUV2ds6fW3s9lr+3m2GBr1HJJjg83hewfIWp1jhxM
M+ARZ5KVi0PIR5La1dSQ0oCxdHZLEYv76xhl3/pcLdPvFjxLkMP0FJ1OyA6onhMiXNh1ZHbOEKO5
msbOrJte2liCuuHvjJZvBs9GBgAB2/a4fw+CVLRNlUeuvwn6aqYKSqatz6hTnuWi1TgiX62ADBf1
FFbKqtn2XrIIaN4kdo4rQBQ+drMgIvFya/fPEuMTBnI0m4o7TBxDGLshXk+hV6wqld9GjftW93KL
r6U9DX37etWoJ3r3a5KAhhxuj/UKw0V4AIB3WUd40lfoBbRsb9WA2nrfU24A+vGXRKpZ84GcqCy1
P1XjbLFI63Sn8wwaXGifVve/kJ9POcKlPW8CZOEA4BNMkUpbYHs3tAxCDnH1/LqU5dcvehFua2Br
99JvAa5LDx6Kv/5SU2gNaLhsQCxp4c22YBC5ZIwX/ryQ87hG8ufEWtud6fv22qM95dNodbeRTezJ
K/98o/DzO+167M6T3ILD5qQJwxMQLzVK+kmtXX82AcKWnzF1SKbyb8mFpUbKhNTKHvYgBR+CFJKj
DPOnn3bQ60540hbhJ8SpbSVszDBPFQJ1mo6l+mp2dFLnqga/nINkJHIjYrKKoA5jF0T6ZjxFlQcO
lJFj4zbbtGyRRsjvuSNLKTV9rhkWbpF/fJfCvBi/h64uhd9m23LLKbgP6+A7H2z3y09An9DRiZii
1LgCxocyOhLRtm097mdFs70BZZM70SstR9E96Gu+oqQGWGKz0CMU5NyaF8dyqCgdVxa99OzuvBvY
UImdFhR17FHtQLvw1Wc3klH2R/vup++k6vikHJJJayS+FGE0k+h/Nl/9GKODY0x57ybkuTaaFsbJ
Do/zqnXjBP5449HEqxbdO/mCeQuQ4rNJpXDK1C/seRxHzVXOLVrQ72wmdqaLhd23g1/DxL6O1KbB
ozj8AkQgS5PLmH1VTtsSowLI4pHBRWIW2IdRbFBZBMCa+CTUk3+xmv2lq90ga3imelye+UKMCxbT
jY0ZaZZ4n9K6CbtUr3pmeAcMKZ6g5zDFpIGu3T7iIVTBqr1fX7ao6LrPjTRt2U9IrSVV6dKKopwK
3f63TWr6rd6RD7RV2QDaqIpTiosgc9C+bfaaWHcTmmynZ++Y2HbzXxiyLXUWxXzYfcJnUK9Q0IFX
kMNJkk0zx1N6pmpFViCrv72Qjcdvzh0DzIgrzsmwbK2E/ULEPeQRYtGvdA6iRKcSCftY/Rfw4cCR
aiPITyob5W8Si/Uy8TCGAgpzMD7+bRJYSAVoYf1rQrBZjkb1j04hKZOh0oyX7DdBYHIXf+o8YLt+
NgqYpY6LvcVSwPAydM1sofcZfEz0m1TY1HH9D2SUEeLdxZJdWJI3q8BNM07xqmwR9oXTUHCwdW0L
aFxeZD9PSX88//2WEU/EpnmlM6w5HDuma5K8HvbRtViS9NGj3itidjwuHvCdOTbKIyNCdBeI3TRH
gYgNdfHK8myTjOOYw/RKfefdm/0DeC/oHd/xJOKK1w9etL519dD92T3gmGVMEcnvkOfx1nkb+AKS
qP2KSer/LS9FZpqFa+3KlYC3nz0E1Ol/vhm1wDa5rJ/4kd6FLUImqnLw10yryNKOfATzh1OAZn/g
8KOSgC+WwacVrQEGEz9WxpArqmd8X7Ih/QRdmu5zgPVgsJvwpsLlsejMGp6my2KomrRgheV29Yfw
24uwM4OYmKdosleyKXD98OP8RxqlCVyRedOmQWsTZ4IBbzUiBCRUWF9b7mH+scBmcNv2Et03rivr
XNWEmUQilJ+IK3IflNo5H3vWvz6R8oSYUTPauVLdIbYKg54FTp6H5Cuiskg=
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
GldLassLiODVgwPWl5GtUvNFVA+ZFVCFDhi7OrBop0rEIGOD7pGMQGd2XL5uXmDjnBa10M9DWskh
bTmllY5ovkWmM+NjjKYtf65BTGkYfwgKQ0A0l0q2oaCRiZEI98rgXRzWg4blHjn3F8mvlotras3b
gty58LDcqChRb34tHz4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YcKo5o/69htYDEreuDNtMbaQmtugz53TAiA3xMek1XTrggXZnceDK+Oacp9AwNeiNftWOxMl66sc
GrZixCPC4jC03qefsJitE5tQCfx9LEom/ln0gke2S5U676zqGFFkGD4igDSppP9+7smsit0JMNFB
3d9nJDwNXaerv07edmo26kGx6IsxHNmGjsmUd8FYgoMDNNDiTN40UA7rfTR1c5FwRoOUAPNW8x7l
lmsL+1mbpRU3rvmnc+tPlMZ9USQRFaWSLPznAatOpRgaHOa1J4DFd6nwIAGf3cDLilhq3YGA2oUb
qXHyz/+dnLIidWUJj1UPrzhk+3OEiFNdeXBKsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
g4qhHdak8eXxEqdympBtDM13xMJwZUSekBKApv5XlolRI2rR14IEYNQEcKRGlZyuFCmDRJDrEYWf
Eokybg18xq2N2hsq8nA4pvk6H9PXJmnhKoFcPeZ1j9mOnXNuEaOZnL6sA21bsPP7tTakNFG0eaXB
2vlDGYPDupMpXlylpEQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YIONylalBSo3oXqXlsOxHxbPAKbTQFLUkNcqhxYuBHSYbie+16iUZHVqekHM1nIPQ8A+NqZHT/Cn
bM+AOf7At893GAAiJmLAoJJQdHh7oO33naeJX4XJ6I+8adw4O4AucHf+iXdDTh+vT4ToH3pNI1H/
fg7BSszZg69zgY/QsPHraQkyFn3n6Pi12TK4KdE5CdqP1IapEJzDzFftP3QIdgztNEm32O7R9UAV
Qu6VW5iu2mw976oaaPRS7xQkeSuh8v3dIBFLuXEUwqgjFtQ1YItY1vsqSSX+qAtcmYqxSAn3rSTu
J315oxld+eYjvTtO32Qn2VPHVzfXPLCqIWAfbA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ggUMon3tDyL18D99zI+gQo2KEmq86nD/UnuCl2KfpNz4G8UqOi9eijpYl6B8kVrp4KbnZWqTmMMF
z/O87hlmFpp4opDcOruJ+qiiTBWsOzFIQR4QZlanEjh8iO0cwSFSAz5sXdE77BCjzgHI7D4UD4Mp
5DA2KyFTsWztU8ricXXTuH6tZLNTLcTvHzJkt/DfkjmJrDlkm0eRAXhG0MUvkNsk32qCBY9RY9AF
1rJxG2dj5ZCJ2l/vueboa3iQZt2OeB1EloxrJDFuQtvPAvA65BsTM387sUTttprjm7eb5Tm0FQU5
vVHNxCllfsk9jW0rLIKm7dBRCgOntC9jDiJa0g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q5sQqbKwLxjG5mFk9qs+sD0CQg8/2B7KTHpwf62hzJF+1CFbVJUQ6go3DO5L0L1mUNINJPIKzaAD
66tkeRifjCdb0XYOSTAxArc1zlCtOMwOn0aTyha/Uq8sc44kv2JFuUoIsn/Tl15lAT4q5PGV1fNq
fyS1evlpX2NGjZCT9kx21/uYFVn1ltB09OkXy1tz0sskN2eMyg54gf1l6cTR+xsVdY2hIoYfIVN9
H8DudSxoFGmVq3nTkLEuIBwpOzIdlqxG/+zUbvpOhAOprRojoI7OuuNVnv8kqbudzrZrZDK0HX1J
I5lc8/JLEOTV1hKGDSaSt1UBFUvr7e8cCqERRg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dpec57YobDtonbQ0UO1SM8G+H4LNYxSkwZ+IOdocIPgFV2eNfdKVGLe5M3kGiFH8cY+OBkva9enL
/OWjF9TA2LAxTndxgG5J0pfUvCDOVC48MZgZnIR8dOHrP7D6LGWfbebBGB9V1IoBt63/ke8Gi6uZ
oukujbRqqhLpZtf77LbVOpOjZYXM0v1IplnrAPnLmHL9Auh/wBXbYFGVV+VhmRndax/hdT5NuXTd
OGVqvHjKXMT4qzPWpaROPHYFYtTWznHqjj27TLk/z5Hdp0nlp4+Ebp4zIwYMnSpg5MVSetpPiSCZ
031Hd1PlF/YfYwbU1r9lJTGrVWMqi/+gd8KaCQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HlE05c2aGsR6rjiuATQqbaTq27Z8ZtyCoeTKodnH2OaArT49PLi5ZL6waWhdrvL68et08IAUs9t+
8aQnVdhvb/0fNHwtevhkpK8kJCPhJmdNdN0DS60RUdlb5/sgSQWjlxx4Yz5wWXrD3w3dhNQaJbzb
PdLh3ZWUZ+ldIzf3OmxXqghMZwvXkPIkeVkEZK5rBVF4df5DItd6+GOemFxXJmppL3ChWMcSlJD6
hgFBtCxft+usPb88sDNxtsPNBhH8Yeq+nZ3gc7A2wXdVKQugUXMV+/6MH4QJagSTzkjs2wVuXfk8
YQcZf8t0t2eS3XkCFdUszXwMtQ8YgrBWqnZp6aSas1JlXWWMk1d316/ym9sdD+dt36sxmIOjr/mr
lNnHAn9fdTEGDWsaXok7ujwI96+Jo6VVX3h+8Qo/6f9dvmB+j9wX01yLiteRc/klH0QWWPFrckTr
rxvZC+0DnkSyRPCISuHF9Op/7iDXfrGDXOIKpGzdPMaHMsKqIpG+QnAb

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fff66ZCQIGGWn4BfihDr7MvimxiiOWXc0eZBNa52g6soH+VWc7Xx3RJ4fuq721E6hCeRxrTK72LX
i9jipHmkI+YxSSUZyntNbeuF7P38Z8QWyEXrCSRJqnLKUeNwU2D2v692GIbbkPNs3o1/p6bS+PZV
fy4p7pkkxRTdZGKmGNuXlDtPr5DhZ0zFptZiF4rQKB5ebp50U6h6HWEJapeIaJRVwy77CM+u0fDT
4A/3o3rPHumuUTiliaQcm/1jofwW8Wyt/fEyoDeskyKFiJxA7nvXRFcO7dw8hnBN2by3mEq8uvFc
fsXjl6FQ6E8njLb3YPebcEhF2fiQl6tfqv3Xsw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TPuKSC49PXr1CyJdt/9jlK1AKgl9KP/2WJFt/Z7vtljlmD6IwyvQTKF40mFUq27M5Fuz/W4X5INe
/y1uccitx3VcJsarTiaoGT9S3DEmWfAhW9Z3EJmLNoB5WF+Gt3VSrbcIFx4bRg1NbAvCsu35cwJ8
qIEuedLHAD9VsRvFu3kQcKMgbKlMKJWQKJUShZN0gC0lrTnoVAzLqEKMNA0qhQg6q9MlU0GGAeTU
4OAGi9IXN69mtGYQcFgRHTN2cuQvbBPQfXj7zjLG/WzUgoqFUvAhtN5JMPKijnF83gwj845lsPtD
BdmC4FzXoM7Od2ck/qbMAIXHv6TTsjznVFUQBg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dz0VP1CnlNHH+A6VEdv/MzTzitzJy9mXlBCOCHhiN+w9HtFx0dUiXe3p32oSt/JL5Z+78HPWFZNr
norYJdshbBxv2VA+Qb4W2FkhsUt+nbeUxZGkOXoHhhGec2Yij8F+xw2PzGlLK+EcjoVFUGoblbgy
lZxtUK/qPijjN/wQqhHPSvrKrho4ht3zcjZjVg8ZVfzx3x04m5pTyiTrTQecuIFEiVC5ZAhCQMxN
lUXGjCmiY2z772Cy8Zi5NhUXuo2561aTzEHBTJmriI9CVs50fIl0kofkrrA0OdX5CS5GkPv09EPz
ZPD7/ZAVOXqA3AlDcqAsaheUQnXkFpEPunVR0w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9104)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
