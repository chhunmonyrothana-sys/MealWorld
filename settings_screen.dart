import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_logic.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final profile = "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFRUXGBcYFxgXGBcaFxgXGBcXGBcXGhgYHSggGB0lHRUXITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQGi0dHyUtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAPsAyQMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAAEBQIDBgEHAAj/xABBEAABAwIDBAcFBgMIAwEAAAABAAIRAyEEBTESQVFhBhMicYGRoTJCscHwFCNSctHhgpKyBxUkM0NTYvGiwtJz/8QAGgEAAwEBAQEAAAAAAAAAAAAAAQIDAAQFBv/EACQRAQEBAQACAwABBAMAAAAAAAABEQISIQMxQQQiUWFxBRMy/9oADAMBAAIRAxEAPwDF06I2G2HsjcOCDqUxew8kxw/sN/KPghcUyHd68zfbvwA8DgPJfUaljFOY3wFZUYpUHxYDwTyhYswdZhbtbI1iAJM8OaMbWa09qmQNDIafQElW4XJqpEhu6bIPEscww4Qe4SjC0yp0GmWwIddpga7irsmhmJptc0XdskEDfb5qjL+22PeGnMK6oDtMqASWkTxsZDvSENY76X4JvVuhjRLDoBqJWOyxjTRpSKYkEdpkkkWMHdpwXomf0tpnmPMLzzJYFMhwbDajgC5pOt7Hcbobcb1oujl7A7/JpwdTUfr4XR9PDtc0AUOsO0RFJ+yzd7TpBjxCCp0GipOwy/vOcRO/2Uzo0GlkbDHgONqdQUmjSZJIJ7ghtNgangWMeSaFNo4sqbbhzjbj1UsTgwWkjDV3cC8lpdzAZsgctfFXswwD5FOm0/iZUcXCN4kibc1F+HEOIp4l5m5e7qxfcPZM+K21siml1TKZDg+kb9lg2nE83PBhDVMDTItRruEztGR6CBHgj6T+rYGg1KJJ9lrXVXui3tCx14neh8bTAMuGKubEgAH+GLLbWyOVsEHBrRTq30ZTAAhvF7rDxVbsvEjZosA4l5c+1iOFu9drYiuBsCsGjgPbjc0gA2hU7QDwes2yLwWuA9TdDa2JvwYJgUKtQmbk9kx3QD8FSyjTaNktfTMxssZtOPECx81dXzJ7xAcG6A9U0udykgQrqGGeWmevAP4Q0OI4EkGByhHa2AamAaT/AJFZwFw5xA36xaeVlRj8PRlrX1HtdbsNAtwBkCU3dlW07aFOtusakDv1CJGCrcWtbe0Bx4XOk+aPk2KsgwzC1x2QQXGJA3AN7tQUNnVGdoMa2SdkaAACxJO7eU6wVI02QbkbRJ5kk/NLa2H25uRF5Bgz3pdHCWrgmmoBDXbMFxi21wjcOXJffYT/ALrf5Wo1uXMbaJnWST4mSuf3bT/22+QR8w8X1JvYZ+VvwCoxLEbh2yxkXlrdOMBWDLKz/ZpPP8J/RL+m/CRzVdlghzrXj5ps3otinaUoHFzmj4mURS6DYkmS+k3+JxPo1MXTrL6PZY5syRJ+C5nWVNrsLgIqNBg8RwPNMsJl76FJjPbLZlwBjWfmpYknU9lx/lnvVPxPfbzjLHlry02LTbkmuLeGw/3XWI8LhafDZNh31HPfTmodYc4DyBCP/u2hEdSyNb3vxuUoh3HaoNMzLWX42Alec5ZatiKevaBjZ2t53TyXqRY0NFmhjSDFg3ZBBPhquMxVPcWj8oHyQFhaOEeagLafj1TifSwTejlFVwANKm65/wA1uy0CdYBl3ctCcc3iqK2NAGhKWGJ6uR1A8EfZ43ltMsfE7iJAKudlJcIc2lHMOe7+Z10Scy5Qq3Y4rMppZK1mj6jRvDDsg/Ex3FfVsoonVr549Y//AOlCri3HQlV/aHb3HzQEYyhTa2G2HC/nz71HsD8PkJS+pWHFUOrLMaOxTR7w8FWca38XolNSqqDUW1sNzjm6yVRUzFvE+ZSvE1RpwQbnSsxv9u2jA07yodZEqvBMhpPh5fvCBrYiCYQEe6oFHrgl9N5cbKzY/wCQ8/2RxnpmWYwCjTAAH3bNBv2RwCudjG75KzuX4n7qnf3G/wBIRHX801t0uG321o934qTcbJAAH13pOKo+imGSv2qrWtaCSdeA3labaFO3MeW3MkXgG6UZqx2oHPT4ozG1jTrOaKjiAd/DgrsZQcafWA7Td+shXvJLzZ7ZA4qCN3ETI8OXJO8vZLDUdcGwSTMGlzrQSbDjO7SxWzwAYOrosLXNDdkxxAufOUOedum5C4nC7bNpgjsw5u4iFj8blFagw1CIpudLLiY5gabl6lRwYaDzGiV9LKDDhwwloO4EifJP38csGX36eZUMYS4XKJr4s28fihcPlrw7uV+Jy9zjbgfiVzeNbyit2KKi7E81HD5S4m/BW1MpcATGi3jW8opOK5qt2KC4/DwJ70E8xqt4juiHYpUvxP1KGfUVLqiGDol9ddwz5JdPsifHcgC8lFMswDebnu3LYzkyVYwLlNu9TpiSBxIQYfOzTk7gXH4/okNGmSC4wG7yfq60GbFraZLt8AN3m/oLLObL6p3Bo8GtCbmBalUxM9lggeru9c+zP4eqkXhnZZc73fpwCq2H8T5lNhdabDuPVsg+434BVuxDx7xUsKPumcmt+ChUG8blK/aknp37Yd8+a0HRHNqdGt1j3hrQCCDJJB4DwWXcmXRjLftFdrNrYbq93Bo4TvOiPNuzAs9PQWMbXrdYwh9NzpnlwM6HktPi6jRTNhsgXuAAEE3JGtAbSgNGgHx5lZTpPmwY77ODIBmqRwH+mOJNp744rt+p7LJ55H2Y42i0ltKiC4gFzjcieB9089VpMjNN9MPYzY2Rsg2Mcli8Cx727Th7bnGOHALRdGa3Vuex3svaY4SP2kJZ17Dq56g3Na9SJZiO9oaAfAxPqlFKnsS4AFx1c7tG/MoLNMT2jBXMDmwcOrfZ3unjyPNa0bz1J6L69Qhx8T3lUh7nOhvCF9i6/bgJxk2Akg+KCLnUkAI+jhpYZGqaOy2QjKWDAbCM5LayOLyLa0ET+8pNiOi5Gt9NV6S7DacEJmGFkRCN4adPLa/R9wDiQRHiklbBQvVsfRDW30WbzDLW1JLeCneVJ0wtKjLgOP0UUBtOO4D0A0+CcP6PV2U3VBSe4eyCGkgTqZA+pWxw2Aw1GgykzDse/YHWVHtBO0RLiJ5nwSTi1Se/p5qXT8k0wGHDDtOu8DaDfw2sTz5I3NMAKFZwY2XmCwbmBwmT6wpZXhCQdgdZUcYJ3Dip2ZTaTZnRFnVXWMmN7u7gNUrxOKkbIGy0bh8TxW3rZHSaduu7rX27Mwwd8XKTZ3QbA6um1s7wIEDfJTz6TtZpjZMJp1Q4KrC02Ndc7RF4GiP+0j8DfJEBGFEMZ+RvwCrqWdHFE02fd0z/AMW/0hU4pmh3qXX2tPoKR6K3A411F+03xG4jgvn3voqm05Nu5Bm+yzpM403OY64EQdWk2E8e9Z7DYN9QlxkideJnXmhcDlTyZuOYW5yeq2nh+1BLZA79R8fRdPNvX2E+Scp08AWYcOdaCOSVYzNabdSRG83Hmi816UUzSdTquDC5pAd7u1u7rrx3EY+rVJIkD0R6/wAJX3densxtKqSWOBcLkf8At3K+r1L27Ww0nuEz3rx2niKlKo2o2pDmmeXMHiCNe9Msi6RvpkNedphOvDvRsuBe99N7RobdUnhHwWyymhACyeWVAe0N49FrcoqdkStzS08YpPKHFRd27XVdTxa0ypVaYhVUDdEPK0Csxn1AkgBIatNwjZ4rX5kLLPYhkkDaDRvJ3BTv2pDLLM4oMpOp1arWmSRqfgCjcrzihBh7HnS1yR5fFZ2v0cZW7dFwIFiZO4KyhkLWNJLnO5EkjwGnijtjovhgLO8sdVxD3VOwxxGyGXc9rRAuLAQFb9iexobSZ1bBuggnmZuU/wAsykspNJcWOBlpJPZaToRojMVl2kukNuTvPFL4fpPX92Fru6sEua50XJsPIDVYTOswNZ5Mujc0+7yW46VYpzZglriSSDw3Ag6d688xVYudpcqVvvBnK/L22J8EVtL7LMGXQ2e/im39yH8R9ENDBFAfdM/I3+kKqsRHNE0G/dM/I3+kIfFsuk6+1J9Atm/qmGAwYeZB2ePBU0qcrTZZgw1snXf3I8c7S93AmKxTm2pAkD15ghDUcdVfYtKPcWgwLTp9b01wuEhhdF4J05K+JPNs9w1SpUG3Zn1+iQYjOQx4bTaIabyJBg6RwWrzasX1Hk7/AGdLAANGn5V5o4EuPGT8U/HMJ31WkzbMPttWvXd1VF2yH7A7IcRsMLWD8XvRyKRaFUuYpUQZhUwmvTv7PsaXs2DfZt4bl6PhGwF5d/ZbSms8f8R8V6+zD2UpPalr6nWVtN03XBQ5L4NITYUS10LtSsgxUg3VOIxA3La2JYqrYlZnHv1AuUyxmMELN4vFi5mAp9U8gnJ8c8NNKYDnbTjytb0T52J2BOsXXnNXpRRpGxJPL9VXT6ch3ZDSJO/SyEtN+t+c+e8une0gjvCMy3PXNpnaipsiACe207vzN9Qsfh8WKhLgdRp+iv63ZMz3o3vD2y/RJ0xzfrXucXEvB2T47o4LP4Sh5nVdzHEtqVyQ2NTY2MnWE2y+mIlR6NB2V4UgQbTrz5dyafZ1zBMgBGWWkLarxOGinRePZfTZ/MGifPXzS3EMkJ7kp63DNpmdoMaRtNIEho3xoe/egDSvaeY3jwW6+xl9KcqwRLhIjee5PtuQ4jdbwQWR4cy4bU8u9Mq2F2GuAi4VOJ6T7vtmqtcbUaX8k/yTMQ7sk7o8+SzmKpmeXoQrMLhSbgmRoRqPrgnKVdJctdQxBdHZOvduPgsbm2WbDy5vsuM90r2VmEdVZs1AHt/8hzSXMOg9T/Skt/C75EIzZdC5Y8lOGdwReCwV/q/ILfUf7P8AEOdGwANxt+yd5f8A2dvZBcdp+4AdkI7aXIVf2YYOK7yeEfqvXaVFIej/AEYGHdJP1vWlZZPzA6qPUqD8OFcXr5p3pilWJoRqk2KBC1FcgpNjcFqQp9Q/NZLNKsa2AXmPSPO3VXFrDDB6rddOsSWU3NGpt56ry2rZJzNp+rkW0cA6aTqruqp1idmq4EthrixzoFyA4QVx2GtI15aHmEFXe4gCTAmBNhOsDcicprSdk34fH5KnU9aTnr22fRfEgtEgppn2LDKTnAjQC/OyzmSVNmRpCa5rRNZrALiZPguaugoweCe87Q2ROlrx8locuyx7iADPgpYbDQLawtZ0eptDAPeIk7h5ofdb6gVuTvaJkdyq6s8vJat7JMQBwkhDfZf+PqE15LOmawNctp0nAkwxliw7MFrb9kBMMwAIFVrR2vas6zuOoSnLag6umz2ey2N4J2bhNsA73HwWm0jSN1tAZ+rJb9mhhk1HaO1bTnPqjq1KQfkqMCOrkXtz9Ql+Y5vsmwCrz9JX7L8xypwdI0J+rb0VluVExBIPGPoK/C4p9Qax33WjwFKG3MppNC3HcHgYA2on4plTACH6xW0SSqxOiWldcYUSYVTncUQce9dbUCW43MWtMaHmqqdYe1KXyNOdN3VRqqHYhLKmMQlTGwUL0pPjPA6VXt3goShjRvXHVri+qGlvOMV0+yOo5xe0bTT/AOJXlOZYdzXFrhBB0X6WoNDgWuEg6rJdLugoqDaYLjhrHDmhme4276rwbqybQmeXYAt7ZtaAN5Wmr9E6jDZ7R+ZpHzXKGShp2qtQOjc26HXWjzzituBBY0m0pplNEjszI3KvE1NogAQBvR2W0wIkKVijQ5VlwI7XwReLwbmHaZpwjRW4WuAAjWYhp7MTP13LSRraWUWOJuRKI6k8006kaBrD4wR4KOw78H15o+IazuCy5zqNLtP9inZppkGGjc98DyKKGSukENpg8SW2/leAd8rV5NQBw9Gzf8qn7o/AEYMM38I8gn/6y+bN08MQBNzEEiLxvgEwlOY5U4mWj0W4q0GxYAJDi8O6SJMeKPjgbpXgcvcDLg3vJ/VaGmy0A3SVuEvd3mQPinWAIaLQe4yjyHQmnSKIDoVIxXFT68EKhF9N8r54VDK43KXWSiBB0nwRewwFjGdKurbsVWu2m2njG9elYggiDosN0ryEP7TRCl3P2LfH1/dVlfSFladk3GoIgo52InVYvL8EaVTaNiE0GOvKSdOznlon4xdpYzSTvWIrY+tUf2ZA3LS5Lh6hIdU8kPLUu5zjb5ZWkJm4yI+KTZdRsmLrK8vpydfZZmGBDtY9JWWzfLwJlpjktbiX7UiYWfzGnAPbJHCJSdG5ZOrTiwPmrMHQKsq0odIHimWT4baeBMDWf3CS30eFwp4xnsta8c7EeoX1TMsU0jaoAeJj0Wvq5W06vefFRpZFT3ie+f1UfGq7Geo51WcIbTDDxc/sjwgT5rn2jF/7+H/ld/8AS1bMnoz7A9FP+6aX4R5BHx6L5Q5yJ5+zUYH+lT1/IEVB3uA7kLkzv8PQv/pU7D8jUb1TtwA712OdUaQ5lKsyw8md3ennUfiJKpr02xAHzQs1txldlrfdHmjMJjIMdkDkoY7Bwb2HIIFzo9lviSp/R/toBiWmxXerad8JFhsSB7V+7RGjEM3WKadFsGGgI1UG9kapd1jp1sqKtd3FbybDKpU5qmvBBDilNTMXCwhAYvFuPFC9GnJT0iY5rjwSzB0nOOhTDHP23ASmWCpQ0QIU3TPksmJZflzRchOKIhB0ao7iiqcJkLbfs9yuruRb6hJiO5Z+kXN0KMp4qoNRqmnRLBFZs7r/ABSTNKNtCOYTcY3c4IXMnWkEgciPgbFCjGWFcaR4p5kmH1dHchKOB6yoOzTcN5ALHeIBgrT4fCtYAAISYbUWM4qZK68clAujULMsX20h3OOs2UesPFZjvJnBuHoWsaVP+gIp1c7h4lLsmBOHoE/7VO38Dbpk1vGNxjd+66UVQYTcz9fFWFrQp1KvL65KDG73arMqfR6ybQIWezTCwYmeS1IKy9fEB5ed4e4eRICn8nqG4JzShQFYo6qWnegeyZjcpapi1lSVCoobEBS3LawCtUjcleKrkp++jKCqYGVhIQ825JzgcRIg8F8cu5KyngTwWbVuwp0tob1dSolXMpIgjRruCOp4m2ioYAEQWWB3H4raGLvtAIvf4hVU8AakgO+vrvVuHwBJndxTWhgww89x3Hkmk0LcDZdlQp6mSd5RVVkIsmyiBH19QmyF0CVWXhFPpDUafDvQ9WlfWFOw8qotBVXVorYUdkIDr7Ls4ayhQgF33dMSbCdgTHFMsLjes0abeUnmsTlFZxo0mlsdhmm7sC4lbnB0opgAQY339eK7OpJEBGmtz9WXdVAum0Rx5qxpj5BIKt74KxuYu2Kr40JM/wAV59VosY2q4k09kT+KUmzjBOAa58En8M7lP5PcPx9gQZCR4l3VO62TskkPG4DcfBPA0EEjUfJLMxwrnh7QQGmNb6j9ly306J7dfXMCD3dylTxvHu/dZrJ8cWnqn3EkA/h5dybuqtBmNEZQs/DhlcKbcQ1KaeIaYgR4qTsU0bpKOlw26xikx7dxShuKncvqOKEwWiO9bybxNi8cVJLGtuimOW828V76gCnhK+0OR0+SXY1xDSRuPxVmWNPVn6sdFp1tPeJOdPcsxxaSw+HzCc0arXi1wstUlwDhr8wjsLjNkh3uu15FVlQsaAAeO4qD38r/AB7lCjimvGqm29j4H5qhEQ3eqqzeX1xCJab3/Y81Go1bNbQEqCIq0xu8R8wqoUrFJVfRfANZQpOPaJp044eyDvTrle/FA5KD9mo7vuqd/wCBqL2ty6EVzAuVH29FGCdNFyoLc1mcBA1VOZ0espniLjv4eSsAk9y6x1p3IUYwOFrh4IJ2XCbeMFE0WjZIkOJAVnSnLHMqCqwSxxvHuk6+BQGGJ2guPv11jr5kvOxkcyobNZ4G8/HVM8H2mD60UcfSBxEnSP8ApHYegGBLyPfqo0aEa2CuJaNGqDgDrdfFPhLXH1eUKVCjdQ2RrvRGHNu5azGlXgQpsddQJUQ6LlTp5Ea79rbaOA+KPwLdmBxt+nqluW9p7jug/JNGi45J+Y3yev6UqNQyQPDvCtpPGhs1w8nf9oesS107rEeKk03I8R3/ALqiIhji0kG3H9UxwuPjsuPCClZO0J3ix+RUA6RG8afojLgWNVTrNcNbqwGe9ZSlV2Uxp5mQIN+aedFvJq5h13qvtclXhMcHjW6Jgc0Sqcof/hqO/wC6p+WwEYRE8EBk5/w9H/8AKn/QEdTMmT9SqFSpT9c1aQIjzUXVBIhQFTTxCzPqpi/KFEGbLrzJhcIsgKL6YdY3G/msvmmUiidtvsnlotSBHj8lB9MOaZFjb9UnfE6huerzXkeZvJftDcuU8XaJWyzvo2CS6mPDesfjcucw6LlvNl9u3nvnue0TUdxUm4lw1uhg13grIslywb8YpmL5I/C1hBSloCZ5ZWaJnUBHaTwFAE3OipqVg4wFyriC6wCuwuGGvmhh/wDzNonAUQ0TysilXRguI4D1VlMzqq8zHP1dqGKd2QecfMfNL8dj+r1HimIbu7yPD/tJc1obQcP+JI8E0+/ZU/79hzHx2H2d8HDwN0fTxgLyz3hccwdCFjsCNpr2H87fmB4fBG03l9IVBZ9OGniWe7PcZCp4QutoACJO/XvUGE6eSCy3GbbQeEBwT/C4YOFkmCFw9JxMhNYf9BW08NBVuxzTyFtZ2tnjaGFowAXmkwNHPqwb9yyOYdIa9UtDnQIi1gTrJjwSetmLqgadIY1oA3QPmuUmEnjxJ+Sj33bXv/xf4nHx8S2bTvC9Ia7ZioTAgcBcQeei9Ny55dTYTJcWguniRPgvHqdBxMMkydBqfBem9F6VYUvvZkxsjeGgQJTfDbrm/wCS+LicyzJT1pvK+eZUAfJRe8LoeMslR21UT6qzZEX4oaygOkki9v1WRzmq4OJIBBvB+S2IZr9apN0kwe00EC8FT7mw/NysoalMi7Y7lWKFM6OHjqFXXp7JhDt1UF51YMGAvZwV+HwEGVVTqXCZtRwb8vSIoBWtgG3D1XAbrobEzviEZE7bVgs08VBpVlN0Kmo390QXHVvDegsaSJtIgjSfPkiqTS5zWjUkAeJABKKxeW1BUdTIgxJM2gmJnmdN6MjPOqbyyo124FMcM0Mq7J9h/Z/hfofUeSnmmR1mVS0N2gdogtggjjO6DMzEQrqGCqPFMOaQZDTbRpeGB3cHEjvCuQbktAse9pOluUblq8rq8fBLhQIaHEcATHOAfMI3AUXXJEBpiDqTIBju2hPepfo/h9EhVdW/grdkN7P6/Nc2TxVCPFcBhX9WwiBtBsSdS55pgacQBNva8UbSwrtkmQCItBJPbcxwmQGw5hG+e65UYPRmvsg6nWB+sohlQvHaJMQ0cmjcI7z5rn3j9j6CcfybP6e5J/psMgx9OjBe37wEs7IBNnODrmJu0t3exwKfUelNKWjZfDt9tNkunXgCfBQ6M4Gm+gxz2Nc5wLnFwkkk3knXQW5BNhl1Ef6TPb/COHcr8SZ6eL/I66vyXy+xLyIHn3qhtSRYIjE7lKk0cEb9oxwm4Xay+aNSund3IgjTM+ihWpyRO6VZv8FHFG3kt+D+stnmTEkuYLcFnmYcg3C9JqD4LP53h2gyBxUuuc9qc9MxUZ6JjSMt8FRUaJ8UQzTySGqbfmrMSezIUGaKxnyWBEnQjgvmuDtf+lFqgw9p3h8FmNMuxTaQcH7d3MdLNmSGknYdPukxpwUWY8te58WdJIG65NpB4nvk6aoRwnXkviLHvR2hgXP8zktqHa2QC1oaWg9oAGZY5rgY0LSEDSzdoAY1rdp1Q1AxsgMptc2oKUkAXeCezMeiszWmCwAi20P6gkmYMDcTTgR/2P1VOb6CxscszrrWnbbJIAMGNDLLbMCBDbcBoj2Y5ztuQIMxZtpftkTEnh48kgy2kBTJAgyfimjT2vrgltGRpMLU7I7JETqZN76wEX1zeKXYA9nyV+yE8I//2Q==";
    final theme = context.watch<ThemeLogic>();
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 20)),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Profile Photo ─────────────────────────────────────────────
          const SizedBox(height: 16),
          Center(
            child: ClipOval(
              child: Image.network(
                profile,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 150,
                  height: 150,
                  color: Colors.blueGrey,
                  child: const Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // ── Appearance ────────────────────────────────────────────────
          Text('Appearance',
              style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                  letterSpacing: 1.2)),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)),
            child: SwitchListTile(
              title: Text('Dark Mode', style: GoogleFonts.lato(fontSize: 16)),
              subtitle: Text(
                  theme.dark ? 'Currently: Dark' : 'Currently: Light',
                  style: GoogleFonts.lato(fontSize: 13, color: Colors.grey)),
              secondary: Icon(
                  theme.dark ? Icons.dark_mode : Icons.light_mode,
                  color: colorScheme.primary),
              value: theme.dark,
              onChanged: (_) => theme.toggleTheme(),
            ),
          ),
          const SizedBox(height: 24),

          // ── About App ─────────────────────────────────────────────────
          Text('About App',
              style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                  letterSpacing: 1.2)),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.info_outline, color: colorScheme.primary),
                  title: Text('App Name', style: GoogleFonts.lato(fontSize: 15)),
                  trailing: Text('MealWorld',
                      style: GoogleFonts.lato(color: Colors.grey, fontSize: 14)),
                ),
                const Divider(height: 1, indent: 16),
                ListTile(
                  leading: Icon(Icons.tag, color: colorScheme.primary),
                  title: Text('Version', style: GoogleFonts.lato(fontSize: 15)),
                  trailing: Text('1.0.0',
                      style: GoogleFonts.lato(color: Colors.grey, fontSize: 14)),
                ),
                const Divider(height: 1, indent: 16),
                ListTile(
                  leading: Icon(Icons.api, color: colorScheme.primary),
                  title: Text('API Source', style: GoogleFonts.lato(fontSize: 15)),
                  trailing: Text('TheMealDB',
                      style: GoogleFonts.lato(color: Colors.grey, fontSize: 14)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}