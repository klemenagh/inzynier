#ifndef VEHICLE_H
#define VEHICLE_H

class Vehicle
{
public:
    Vehicle() = default;
    Vehicle(double length, unsigned numAxles, double axles[5], bool is5up) {
        this->length = length;
        this->num_axles = numAxles;

        for(unsigned i = 0; i < numAxles; i++) {
            this->axle_positions[i] = axles[i];
        }
        for(int i = numAxles; i < 5; i++) this->axle_positions[i] = 0;

        this->axle5up = is5up;
    }

    double      getLength() const { return this->length; }
    unsigned    getAxlesNumber() const { return this->num_axles; }
    double      getAxlePosition(unsigned index) const {
        if(this->num_axles < index) return 0;
        else return this->axle_positions[index];
    }
    bool is5up() const { return this->axle5up; }

private:
    double length;
    unsigned num_axles;
    double axle_positions[5];

    bool axle5up;
};

#endif // VEHICLE_H

